//
//  PFCloud+RAC.h
//  Parse+ReactiveCocoa
//
//  Created by Gertjan Leemans on 02/01/15.
//  Copyright (c) 2015 Digitalisma. All rights reserved.
//

#import <Parse/Parse.h>

@class RACSignal;

@interface PFCloud (RAC)

+ (RACSignal *)rac_callFunction:(NSString *)function withParameters:(NSDictionary *)parameters;

@end
