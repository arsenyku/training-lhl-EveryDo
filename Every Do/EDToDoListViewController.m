//
//  MasterViewController.m
//  Every Do
//
//  Created by asu on 2015-09-08.
//  Copyright (c) 2015 asu. All rights reserved.
//

#import "EDToDoListViewController.h"
#import "EDDetailViewController.h"
#import "EDNewToDoViewController.h"
#import "EDToDoCellView.h"
#import "EDTodo.h"
#import "NSDate+format.h"

@interface EDToDoListViewController () <ToDoItemDelegate>


@property (nonatomic) NSMutableArray *toDoList;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;

@end

@implementation EDToDoListViewController
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    NSArray *stuffToDo = @[ @"cook dinner", @"watch movie", @"do laundry", @"buy milk", @"feed dog" ];
    
    for (int i=0; i < 5; i++){
        EDTodo *todo = [EDTodo new];
        todo.title = stuffToDo[i];//[NSString stringWithFormat:@"Task #%d", i];
        
        [self insertNewTodo:todo];
    }
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - control events

- (IBAction)newTodo:(UIBarButtonItem*)sender {
    [self performSegueWithIdentifier:@"newTodo" sender:self];
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        EDTodo *object = self.toDoList[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    } else if ([[segue identifier] isEqualToString:@"newTodo"]) {
        ((EDNewToDoViewController*)segue.destinationViewController).delegate = self;
    	
    }
    
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.toDoList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EDToDoCellView *cell = [tableView dequeueReusableCellWithIdentifier:@"TodoCell" forIndexPath:indexPath];

    EDTodo *todo = self.toDoList[indexPath.row];
    [cell setContentWithTitle:todo.title sortTitle:[NSString stringWithFormat:@"Complete by: %@", [todo.completeBy dateStringWithFormat:@"dd-MMM-YYYY"]]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.toDoList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

#pragma mark - <ToDoItemDelegate>

-(void)receiveToDoItem:(EDTodo *)item{
    [self insertNewTodo:item];
}

#pragma mark - private

- (void)insertNewTodo:(EDTodo*)sender {
    if (!self.toDoList) {
        self.toDoList = [[NSMutableArray alloc] init];
    }
    [self.toDoList insertObject:sender atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}



@end
