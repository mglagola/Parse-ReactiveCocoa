//
//  PFPush+RAC.m
//  Parse+ReactiveCocoa
//
//  Created by Gertjan Leemans on 21/01/15.
//  Copyright (c) 2015 Digitalisma. All rights reserved.
//

#import "PFPush+RAC.h"
#import "RACCallbacks.h"

#import <ReactiveCocoa/ReactiveCocoa.h>
#import <ReactiveCocoa/RACEXTRuntimeExtensions.h>

@implementation PFPush (RAC)

+ (RACSignal *)rac_sendPushMessageToChannel:(NSString *)channel withMessage:(NSString *)message
{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      [self sendPushMessageToChannelInBackground:channel withMessage:message block:PFRACBooleanCallback(subscriber)];
      return nil;
    }]
        setNameWithFormat:@"PFPush +rac_sendPushMessageToChannel: %@ withMessage: %@", channel, message];
}

+ (RACSignal *)rac_sendPushMessageToQuery:(PFQuery *)query withMessage:(NSString *)message
{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      [self sendPushMessageToQueryInBackground:query withMessage:message block:PFRACBooleanCallback(subscriber)];
      return nil;
    }]
        setNameWithFormat:@"PFPush +rac_sendPushMessageToQuery: %@ withMessage: %@", query, message];
}

+ (RACSignal *)rac_sendPushDataToChannel:(NSString *)channel withData:(NSDictionary *)data
{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      [self sendPushDataToChannelInBackground:channel withData:data block:PFRACBooleanCallback(subscriber)];
      return nil;
    }]
        setNameWithFormat:@"PFPush +rac_sendPushDataToChannel: %@ withData: %@", channel, data];
}

+ (RACSignal *)rac_sendPushDataToQuery:(PFQuery *)query withData:(NSDictionary *)data
{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      [self sendPushDataToQueryInBackground:query withData:data block:PFRACBooleanCallbackWithObject(subscriber, self)];
      return nil;
    }]
        setNameWithFormat:@"PFPush +rac_sendPushDataToQuery: %@ withData: %@", query, data];
}

+ (RACSignal *)rac_getSubscribedChannels
{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      [self getSubscribedChannelsInBackgroundWithBlock:PFRACObjectCallback(subscriber, YES)];
      return nil;
    }]
        setNameWithFormat:@"PFPush +rac_getSubscribedChannels"];
}

+ (RACSignal *)rac_subscribeToChannel:(NSString *)channel
{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      [self subscribeToChannelInBackground:channel block:PFRACBooleanCallback(subscriber)];
      return nil;
    }]
        setNameWithFormat:@"PFPush +rac_subscribeToChannel: %@", channel];
}

+ (RACSignal *)rac_unsubscribeFromChannel:(NSString *)channel
{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      [self unsubscribeFromChannelInBackground:channel block:PFRACBooleanCallback(subscriber)];
      return nil;
    }]
        setNameWithFormat:@"PFPush +rac_unsubscribeFromChannel: %@", channel];
}

- (RACSignal *)rac_sendPush
{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      [self sendPushInBackgroundWithBlock:PFRACBooleanCallback(subscriber)];
      return nil;
    }]
        setNameWithFormat:@"%@ -rac_sendPush", self];
}

@end
