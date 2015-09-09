//
//  EDNewToDoViewController.h
//  Every Do
//
//  Created by asu on 2015-09-08.
//  Copyright (c) 2015 asu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EDTodo.h"

@protocol ToDoItemDelegate <NSObject>

-(void)receiveToDoItem:(EDTodo*)item;

@end

@interface EDNewToDoViewController : UITableViewController
@property (nonatomic, weak) id<ToDoItemDelegate> delegate;
@end
