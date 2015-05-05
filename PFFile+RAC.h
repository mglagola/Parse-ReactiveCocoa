//
//  PFFile+RAC.h
//  Parse+ReactiveCocoa
//
//  Created by Gertjan Leemans on 17/12/14.
//  Copyright (c) 2014 Digitalisma. All rights reserved.
//

#import <Parse/Parse.h>

@class RACSignal;

@interface PFFile (RAC)

- (RACSignal *)rac_save;
- (RACSignal *)rac_getData;

@end
