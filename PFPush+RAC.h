//
//  PFPush+RAC.h
//  Parse+ReactiveCocoa
//
//  Created by Gertjan Leemans on 21/01/15.
//  Copyright (c) 2015 Digitalisma. All rights reserved.
//

#import <Parse/Parse.h>

@class RACSignal;

@interface PFPush (RAC)

+ (RACSignal *)rac_sendPushMessageToChannel:(NSString *)channel withMessage:(NSString *)message;
+ (RACSignal *)rac_sendPushMessageToQuery:(PFQuery *)query withMessage:(NSString *)message;
+ (RACSignal *)rac_sendPushDataToChannel:(NSString *)channel withData:(NSDictionary *)data;
+ (RACSignal *)rac_sendPushDataToQuery:(PFQuery *)query withData:(NSDictionary *)data;

- (RACSignal *)rac_sendPush;

+ (RACSignal *)rac_getSubscribedChannels;
+ (RACSignal *)rac_subscribeToChannel:(NSString *)channel;
+ (RACSignal *)rac_unsubscribeFromChannel:(NSString *)channel;

@end
