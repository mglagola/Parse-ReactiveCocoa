//
//  PFFacebookUtils+RAC.m
//  Parse+ReactiveCocoa
//
//  Created by Gertjan Leemans on 17/12/14.
//  Copyright (c) 2014 Digitalisma. All rights reserved.
//

#import "PFFacebookUtils+RAC.h"
#import "RACCallbacks.h"

#import <ReactiveCocoa/ReactiveCocoa.h>
#import <ReactiveCocoa/RACEXTRuntimeExtensions.h>

@implementation PFFacebookUtils (RAC)

+ (RACSignal *)loginWithPermissions:(NSArray *)permissions
{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      [self logInWithPermissions:permissions block:PFRACObjectCallback(subscriber, YES)];
      return nil;
    }] setNameWithFormat:@"PFFacebookUtils +loginWithPermissions: %@", permissions];
}

@end
