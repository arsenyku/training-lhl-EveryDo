//
//  DetailViewController.h
//  Every Do
//
//  Created by asu on 2015-09-08.
//  Copyright (c) 2015 asu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EDTodo.h"

@interface EDDetailViewController : UIViewController

@property (strong, nonatomic) EDTodo *detailItem;
//@property (strong, nonatomic) EDTodo *todoItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

