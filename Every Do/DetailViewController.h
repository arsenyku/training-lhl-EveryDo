//
//  DetailViewController.h
//  Every Do
//
//  Created by asu on 2015-09-08.
//  Copyright (c) 2015 asu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

