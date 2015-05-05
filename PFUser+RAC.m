//
//  PFUser+RAC.m
//  Parse+ReactiveCocoa
//
//  Created by Gertjan Leemans on 17/12/14.
//  Copyright (c) 2014 Digitalisma. All rights reserved.
//

#import "PFUser+RAC.h"
#import "RACCallbacks.h"

#import <ReactiveCocoa/ReactiveCocoa.h>
#import <ReactiveCocoa/RACEXTRuntimeExtensions.h>

@implementation PFUser (RAC)

+ (RACSignal *)rac_logInWithUsername:(NSString *)username password:(NSString *)password
{
    return [[RACSignal
        createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
          [self logInWithUsernameInBackground:username password:password block:PFRACObjectCallback(subscriber, YES)];
          return nil;
        }]
        setNameWithFormat:@"PFUser +rac_logInWithUsername: %@ password: %@", username, password];
}

+ (RACSignal *)rac_requestPasswordResetForEmail:(NSString *)email
{
    return [[RACSignal
        createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
          [self requestPasswordResetForEmailInBackground:email block:PFRACBooleanCallbackWithObject(subscriber, self)];
          return nil;
        }]
        setNameWithFormat:@"PFUser +rac_requestPasswordResetForEmail: %@", email];
}

- (RACSignal *)rac_signUp
{
    return [[RACSignal
        createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
          [self signUpInBackgroundWithBlock:PFRACBooleanCallbackWithObject(subscriber, self)];
          return nil;
        }]
        setNameWithFormat:@"%@ -rac_signUp", self];
}

@end
