//
//  DetailViewController.m
//  Every Do
//
//  Created by asu on 2015-09-08.
//  Copyright (c) 2015 asu. All rights reserved.
//

#import "EDDetailViewController.h"
#import "EDTodo.h"

@interface EDDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *completeByLabel;
@end

@implementation EDDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = self.detailItem.title;
        self.completeByLabel.text = [ NSString stringWithFormat:@"Complete by: %@",[self.detailItem.completeBy description] ];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
