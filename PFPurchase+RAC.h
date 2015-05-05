//
//  PFPurchase+RAC.h
//  Parse+ReactiveCocoa
//
//  Created by Gertjan Leemans on 25/03/15.
//  Copyright (c) 2015 Digitalisma. All rights reserved.
//

#import <Parse/Parse.h>

@class RACSignal;

@interface PFPurchase (RAC)

+ (RACSignal *)rac_buyProduct:(NSString *)productIdentifier;

@end
