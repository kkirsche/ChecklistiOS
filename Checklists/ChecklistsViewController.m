//
//  ChecklistsViewController.m
//  Checklists
//
//  Created by Kevin Kirsche on 2/18/13.
//  Copyright (c) 2013 Kevin Kirsche. All rights reserved.
//

#import "ChecklistsViewController.h"
#import "ChecklistItem.h";

@interface ChecklistsViewController ()

@end

@implementation ChecklistsViewController {
    ChecklistItem *row0item;
    ChecklistItem *row1item;
    ChecklistItem *row2item;
    ChecklistItem *row3item;
    ChecklistItem *row4item;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    row0item = [[ChecklistItem alloc] init];
    row0item.text = @"Walk the dog";
    row0item.checked = NO;
    
    row1item = [[ChecklistItem alloc] init];
    row1item.text = @"Brush my teeth";
    row1item.checked = YES;
    
    row2item = [[ChecklistItem alloc] init];
    row2item.text = @"Learn iOS Development";
    row2item.checked = YES;
    
    row3item = [[ChecklistItem alloc] init];
    row3item.text = @"Soccer practice";
    row3item.checked = NO;
    
    row4item = [[ChecklistItem alloc] init];
    row4item.text = @"Eat ice cream";
    row4item.checked = YES;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (void)configureCheckmarkForCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    BOOL isChecked = NO;
    if (indexPath.row == 0) {
        isChecked = row0item.checked;
    } else if (indexPath.row == 1) {
        isChecked = row1item.checked;
    } else if (indexPath.row == 2) {
        isChecked = row2item.checked;
    } else if (indexPath.row == 3) {
        isChecked = row3item.checked;
    } else if (indexPath.row == 4) {
        isChecked = row4item.checked;
    }
    
    if (isChecked) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    
    if (indexPath.row == 0) {
        label.text = row0item.text;
    } else if (indexPath.row == 1) {
        label.text = row1item.text;
    } else if (indexPath.row == 2) {
        label.text = row2item.text;
    } else if (indexPath.row == 3) {
        label.text = row3item.text;
    } else if (indexPath.row == 4) {
        label.text = row4item.text;
    }
    
    [self configureCheckmarkForCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        row0item.checked = !row0item.checked;
    } else if (indexPath.row == 1) {
        row1item.checked = !row1item.checked;
    } else if (indexPath.row == 2) {
        row2item.checked = !row2item.checked;
    } else if (indexPath.row == 3) {
        row3item.checked = !row3item.checked;
    } else if (indexPath.row == 4) {
        row4item.checked = !row4item.checked;
    }
    
    [self configureCheckmarkForCell:cell atIndexPath:indexPath];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
