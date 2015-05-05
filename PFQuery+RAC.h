//
//  PFQuery+RAC.h
//  Parse+ReactiveCocoa
//
//  Created by Gertjan Leemans on 16/12/14.
//  Copyright (c) 2014 Digitalisma. All rights reserved.
//

#import <Parse/Parse.h>

@class RACSignal;

@interface PFQuery (RAC)

- (RACSignal *)rac_getObjectWithId:(NSString *)objectId;
- (RACSignal *)rac_findObjects;
- (RACSignal *)rac_getFirstObject;
- (RACSignal *)rac_countObjects;

@end
