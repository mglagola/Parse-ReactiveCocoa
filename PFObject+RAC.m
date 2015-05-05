//
//  PFObject+RAC.m
//  Parse+ReactiveCocoa
//
//  Created by Gertjan Leemans on 16/12/14.
//  Copyright (c) 2014 Digitalisma. All rights reserved.
//

#import "PFObject+RAC.h"
#import "RACCallbacks.h"

#import <ReactiveCocoa/ReactiveCocoa.h>
#import <ReactiveCocoa/RACEXTRuntimeExtensions.h>

@implementation PFObject (RAC)

+ (RACSignal *)rac_saveAll:(NSArray *)objects
{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      [self saveAllInBackground:objects block:PFRACBooleanCallbackWithObject(subscriber, self)];
      return nil;
    }]
        setNameWithFormat:@"PFObject +rac_saveAll: %@", objects];
}

+ (RACSignal *)rac_fetchAll:(NSArray *)objects
{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      [self fetchAllInBackground:objects block:PFRACObjectCallback(subscriber, YES)];
      return nil;
    }]
        setNameWithFormat:@"PFObject +rac_fetchAll: %@", objects];
}

+ (RACSignal *)rac_fetchAllIfNeeded:(NSArray *)objects
{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      [self fetchAllIfNeededInBackground:objects block:PFRACObjectCallback(subscriber, YES)];
      return nil;
    }]
        setNameWithFormat:@"PFObject +rac_fetchAllIfNeeded: %@", objects];
}

+ (RACSignal *)rac_deleteAll:(NSArray *)objects
{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      [self deleteAllInBackground:objects block:PFRACBooleanCallbackWithObject(subscriber, self)];
      return nil;
    }]
        setNameWithFormat:@"PFObject +rac_deleteAll: %@", objects];
}

- (RACSignal *)rac_save
{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      [self saveInBackgroundWithBlock:PFRACBooleanCallbackWithObject(subscriber, self)];
      return nil;
    }]
        setNameWithFormat:@"%@ -rac_save", self];
}

- (RACSignal *)rac_saveEventually
{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      [self saveEventually:PFRACBooleanCallbackWithObject(subscriber, self)];
      return nil;
    }]
        setNameWithFormat:@"%@ -rac_saveEventually", self];
}

- (RACSignal *)rac_fetch
{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      [self fetchInBackgroundWithBlock:PFRACObjectCallback(subscriber, YES)];
      return nil;
    }]
        setNameWithFormat:@"%@ -rac_fetch", self];
}

- (RACSignal *)rac_fetchIfNeeded
{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      [self fetchIfNeededInBackgroundWithBlock:PFRACObjectCallback(subscriber, YES)];
      return nil;
    }]
        setNameWithFormat:@"%@ -rac_fetchIfNeeded", self];
}

- (RACSignal *)rac_delete
{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      [self deleteInBackgroundWithBlock:PFRACBooleanCallbackWithObject(subscriber, self)];
      return nil;
    }]
        setNameWithFormat:@"%@ -rac_delete", self];
}

@end
