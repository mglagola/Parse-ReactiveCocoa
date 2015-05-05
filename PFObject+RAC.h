//
//  PFObject+RAC.h
//  Parse+ReactiveCocoa
//
//  Created by Gertjan Leemans on 16/12/14.
//  Copyright (c) 2014 Digitalisma. All rights reserved.
//

#import <Parse/Parse.h>

@class RACSignal;

@interface PFObject (RAC)

+ (RACSignal *)rac_saveAll:(NSArray *)objects;
+ (RACSignal *)rac_fetchAll:(NSArray *)objects;
+ (RACSignal *)rac_fetchAllIfNeeded:(NSArray *)objects;
+ (RACSignal *)rac_deleteAll:(NSArray *)objects;
- (RACSignal *)rac_save;
- (RACSignal *)rac_saveEventually;
- (RACSignal *)rac_fetch;
- (RACSignal *)rac_fetchIfNeeded;
- (RACSignal *)rac_delete;

@end
