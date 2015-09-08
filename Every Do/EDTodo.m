//
//  Todo.m
//  Every Do
//
//  Created by asu on 2015-09-08.
//  Copyright (c) 2015 asu. All rights reserved.
//

#import "EDTodo.h"

@implementation EDTodo

- (instancetype)init
{
    self = [super init];
    if (self) {
        _title = @"";
        _taskDescription = @"";
        _priorityNumber = 0;
        _completed = NO;
        _createdOn = [NSDate new];
        _completeBy = [self.createdOn dateByAddingTimeInterval:2*24*60*60];
    }
    return self;
}
@end
