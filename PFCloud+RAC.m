//
//  PFCloud+RAC.m
//  Parse+ReactiveCocoa
//
//  Created by Gertjan Leemans on 02/01/15.
//  Copyright (c) 2015 Digitalisma. All rights reserved.
//

#import "PFCloud+RAC.h"
#import "RACCallbacks.h"

#import <ReactiveCocoa/ReactiveCocoa.h>
#import <ReactiveCocoa/RACEXTRuntimeExtensions.h>

@implementation PFCloud (RAC)

+ (RACSignal *)rac_callFunction:(NSString *)function withParameters:(NSDictionary *)parameters
{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      [self callFunctionInBackground:function withParameters:parameters block:PFRACObjectCallback(subscriber, YES)];
      return nil;
    }]
        setNameWithFormat:@"PFCloud +rac_callFunction: %@ withParameters: %@", function, parameters];
}

@end
