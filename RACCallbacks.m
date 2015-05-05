//
//  RACCallbacks.m
//  Parse+ReactiveCocoa
//
//  Created by Gertjan Leemans on 16/12/14.
//  Copyright (c) 2014 Digitalisma. All rights reserved.
//

#import "RACCallbacks.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

PFBooleanResultBlock PFRACBooleanCallbackWithObject(id<RACSubscriber> subscriber, id object)
{
    return ^(BOOL succeeded, NSError *error) {
      if (succeeded)
      {
          [subscriber sendNext:object];
          [subscriber sendCompleted];
      }
      else
      {
          [subscriber sendError:error];
      }
    };
}

PFBooleanResultBlock PFRACBooleanCallback(id<RACSubscriber> subscriber)
{
    return ^(BOOL succeeded, NSError *error) {
      if (succeeded)
      {
          [subscriber sendCompleted];
      }
      else
      {
          [subscriber sendError:error];
      }
    };
}

PFIdResultBlock PFRACObjectCallback(id<RACSubscriber> subscriber, BOOL completed)
{
    return ^(id result, NSError *error) {
      if (error == nil)
      {
          [subscriber sendNext:result];
          if (completed)
          {
              [subscriber sendCompleted];
          }
      }
      else
      {
          [subscriber sendError:error];
      }
    };
}

PFIntegerResultBlock PFRACIntegerCallback(id<RACSubscriber> subscriber)
{
    return ^(int number, NSError *error) {
      if (error == nil)
      {
          [subscriber sendNext:@(number)];
          [subscriber sendCompleted];
      }
      else
      {
          [subscriber sendError:error];
      }
    };
}
