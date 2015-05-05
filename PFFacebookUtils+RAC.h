//
//  PFFacebookUtils+RAC.h
//  Parse+ReactiveCocoa
//
//  Created by Gertjan Leemans on 17/12/14.
//  Copyright (c) 2014 Digitalisma. All rights reserved.
//

#import <Parse/Parse.h>
#import <ParseFacebookUtils/PFFacebookUtils.h>

@class RACSignal;

@interface PFFacebookUtils (RAC)

+ (RACSignal *)loginWithPermissions:(NSArray *)permissions;

@end
