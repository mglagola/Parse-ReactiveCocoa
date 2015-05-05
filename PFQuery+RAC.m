//
//  PFQuery+RAC.m
//  Parse+ReactiveCocoa
//
//  Created by Gertjan Leemans on 16/12/14.
//  Copyright (c) 2014 Digitalisma. All rights reserved.
//

#import "PFQuery+RAC.h"
#import "RACCallbacks.h"

#import <ReactiveCocoa/ReactiveCocoa.h>
#import <ReactiveCocoa/RACEXTRuntimeExtensions.h>

@implementation PFQuery (RAC)

- (RACSignal *)rac_getObjectWithId:(NSString *)objectId
{
    __block NSUInteger callbackNumber = 0;
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      BOOL completed = self.cachePolicy != kPFCachePolicyCacheThenNetwork || ++callbackNumber == 2;
      [self getObjectInBackgroundWithId:objectId block:PFRACObjectCallback(subscriber, completed)];

      return [RACDisposable disposableWithBlock:^{
        [self cancel];
      }];
    }]
        setNameWithFormat:@"%@ -rac_getObjectWithId", self];
}

- (RACSignal *)rac_findObjects
{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      __block NSUInteger callbackNumber = 0;
      [self findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (self.cachePolicy == kPFCachePolicyCacheThenNetwork && ++callbackNumber == 1)
        {
            if (error.code == kPFErrorCacheMiss && [error.domain isEqualToString:@"Parse"])
            {
                PFRACObjectCallback(subscriber, NO)(nil, nil);
                return;
            };
        }

        BOOL completed = self.cachePolicy != kPFCachePolicyCacheThenNetwork || callbackNumber == 2;
        PFRACObjectCallback(subscriber, completed)(objects, error);
      }];

      return [RACDisposable disposableWithBlock:^{
        [self cancel];
      }];
    }]
        setNameWithFormat:@"%@ -rac_findObjects", self];
}

- (RACSignal *)rac_getFirstObject
{
    __block NSUInteger callbackNumber = 0;
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      [self getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        if (self.cachePolicy == kPFCachePolicyCacheThenNetwork && ++callbackNumber == 1)
        {
            if (error.code == kPFErrorCacheMiss && [error.domain isEqualToString:@"Parse"])
            {
                PFRACObjectCallback(subscriber, NO)(nil, nil);
                return;
            };
        }

        BOOL completed = self.cachePolicy != kPFCachePolicyCacheThenNetwork || callbackNumber == 2;
        PFRACObjectCallback(subscriber, completed)(object, error);
      }];

      return [RACDisposable disposableWithBlock:^{
        [self cancel];
      }];
    }]
        setNameWithFormat:@"%@ -rac_getFirstObject", self];
}

- (RACSignal *)rac_countObjects
{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      [self countObjectsInBackgroundWithBlock:PFRACIntegerCallback(subscriber)];

      return [RACDisposable disposableWithBlock:^{
        [self cancel];
      }];
    }]
        setNameWithFormat:@"%@ -rac_countObjects", self];
}

@end
