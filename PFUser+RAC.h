//
//  PFUser+RAC.h
//  Parse+ReactiveCocoa
//
//  Created by Gertjan Leemans on 17/12/14.
//  Copyright (c) 2014 Digitalisma. All rights reserved.
//

#import <Parse/Parse.h>

@class RACSignal;

@interface PFUser (RAC)

+ (RACSignal *)rac_logInWithUsername:(NSString *)username password:(NSString *)password;
+ (RACSignal *)rac_requestPasswordResetForEmail:(NSString *)email;

- (RACSignal *)rac_signUp;

@end
