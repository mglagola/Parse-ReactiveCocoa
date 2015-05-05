//
//  PFPurchase+RAC.m
//  Parse+ReactiveCocoa
//
//  Created by Gertjan Leemans on 25/03/15.
//  Copyright (c) 2015 Digitalisma. All rights reserved.
//

#import "PFPurchase+RAC.h"
#import "RACCallbacks.h"

#import <ReactiveCocoa/ReactiveCocoa.h>
#import <ReactiveCocoa/RACEXTRuntimeExtensions.h>

@implementation PFPurchase (RAC)

+ (RACSignal *)rac_buyProduct:(NSString *)productIdentifier
{
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
      [self buyProduct:productIdentifier
                 block:^(NSError *error) {
                   if (error)
                   {
                       [subscriber sendError:error];
                   }
                   else
                   {
                       [subscriber sendNext:@YES];
                       [subscriber sendCompleted];
                   }
                 }];
      return nil;
    }]
        setNameWithFormat:@"PFPurchase +rac_buyProduct: %@", productIdentifier];
}

@end
