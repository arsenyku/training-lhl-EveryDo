//
//  EDToDoCellView.m
//  Every Do
//
//  Created by asu on 2015-09-08.
//  Copyright (c) 2015 asu. All rights reserved.
//

#import "EDToDoCellView.h"
@interface EDToDoCellView()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *sortByLabel;
@end

@implementation EDToDoCellView
-(void)setContentWithTitle:(NSString *)title sortTitle:(NSString *)sortTitle{
    self.titleLabel.text = title;
    self.sortByLabel.text = sortTitle;
}

@end
