//
//  Todo.h
//  Every Do
//
//  Created by asu on 2015-09-08.
//  Copyright (c) 2015 asu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EDTodo : NSObject
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *taskDescription;
@property (nonatomic) int priorityNumber;
@property (nonatomic) BOOL completed;
@property (nonatomic) NSDate *completeBy;
@property (nonatomic) NSDate *createdOn;
@end
