//
//  PFFile+RAC.m
//  Parse+ReactiveCocoa
//
//  Created by Gertjan Leemans on 17/12/14.
//  Copyright (c) 2014 Digitalisma. All rights reserved.
//

#import "PFFile+RAC.h"
#import "RACCallbacks.h"

#import <ReactiveCocoa/ReactiveCocoa.h>
#import <ReactiveCocoa/RACEXTRuntimeExtensions.h>

@implementation PFFile (RAC)

- (RACSignal *)rac_save
{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      [self saveInBackgroundWithBlock:PFRACBooleanCallbackWithObject(subscriber, self)];
      return [RACDisposable disposableWithBlock:^{
        [self cancel];
      }];
    }]
        setNameWithFormat:@"%@ -rac_save", self];
}

- (RACSignal *)rac_getData
{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      [self getDataInBackgroundWithBlock:PFRACObjectCallback(subscriber, YES)];
      return [RACDisposable disposableWithBlock:^{
        [self cancel];
      }];
    }]
        setNameWithFormat:@"%@ -rac_getData", self];
}

@end
