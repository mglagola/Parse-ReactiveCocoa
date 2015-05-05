//
//  RACCallbacks.h
//  Parse+ReactiveCocoa
//
//  Created by Gertjan Leemans on 16/12/14.
//  Copyright (c) 2014 Digitalisma. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/PFConstants.h>

@protocol RACSubscriber;

PFBooleanResultBlock PFRACBooleanCallbackWithObject(id<RACSubscriber> subscriber, id object);
PFBooleanResultBlock PFRACBooleanCallback(id<RACSubscriber> subscriber);
PFIdResultBlock PFRACObjectCallback(id<RACSubscriber> subscriber, BOOL completed);
PFIntegerResultBlock PFRACIntegerCallback(id<RACSubscriber> subscriber);
