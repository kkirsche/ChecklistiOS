//
//  ChecklistsViewController.m
//  Checklists
//
//  Created by Kevin Kirsche on 2/18/13.
//  Copyright (c) 2013 Kevin Kirsche. All rights reserved.
//

#import "ChecklistsViewController.h"
#import "ChecklistItem.h"

@interface ChecklistsViewController ()

@end

@implementation ChecklistsViewController {
    NSMutableArray *items;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    items = [[NSMutableArray alloc] initWithCapacity:20];
    
    ChecklistItem *item;
    
    //Create the "item" object.
    //Set the text and if it is checked or not.
    //We then add the "item" object to Mutable array "items".
    item = [[ChecklistItem alloc] init];
    item.text = @"Walk the dog";
    item.checked = NO;
    [items addObject:item];
    
    item = [[ChecklistItem alloc] init];
    item.text = @"Brush my teeth";
    item.checked = YES;
    [items addObject:item];
    
    item = [[ChecklistItem alloc] init];
    item.text = @"Learn iOS development";
    item.checked = YES;
    [items addObject:item];
    
    item = [[ChecklistItem alloc] init];
    item.text = @"Soccer practice";
    item.checked = NO;
    [items addObject:item];
    
    item = [[ChecklistItem alloc] init];
    item.text = @"Eat ice cream";
    item.checked = YES;
    [items addObject:item];
    
    item = [[ChecklistItem alloc] init];
    item.text = @"Testing the exercise before \"Cleaning Up Your Code\"";
    item.checked = NO;
    [items addObject:item];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //returns the number of rows within the NSMutableArray "items". 
    return [items count];
}

- (void)configureCheckmarkForCell:(UITableViewCell *)cell withChecklistItem:(ChecklistItem *)item
{
    UILabel *label = (UILabel *)[cell viewWithTag:1001];
    
    if (item.checked) {
        label.text = @"√";
    } else {
        label.text = @"";
    }
}

- (void)configureTextForCell:(UITableViewCell *)cell withChecklistItem:(ChecklistItem *)item
{
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    label.text = item.text;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    
    //Grab the item that the user pressed. This will let us use it's attributes such as .checked and .text
    ChecklistItem *item = [items objectAtIndex:indexPath.row];
    
    [self configureTextForCell:cell withChecklistItem:item];
    [self configureCheckmarkForCell:cell withChecklistItem:item];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    //Grab the item that the user pressed. This will let us use it's attributes such as .checked and .text
    ChecklistItem *item = [items objectAtIndex:indexPath.row];
    [item toggleChecked];
    
    [self configureCheckmarkForCell:cell withChecklistItem:item];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    ChecklistItem *item = [items objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"EditItem" sender:item];
}

//add swipe to delete
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //when the "commitEditingStyle" method is present (it comes from the table view data source), the table view will automatically enable swipe-to-delete. All we have tod o is remove the item from our data model.
    [items removeObjectAtIndex:indexPath.row];
    //Next we just delete the corresponding row from the table view.
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}

/*
 // Implement the protocol for itemDetailViewController
 //
 */
- (void)itemDetailViewControllerDidCancel:(ItemDetailViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)itemDetailViewController:(ItemDetailViewController *)controller didFinishAddingItem:(ChecklistItem *)item
{
    int newRowIndex = [items count];
    [items addObject:item];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)itemDetailViewController:(ItemDetailViewController *)controller didFinishEditingItem:(ChecklistItem *)item
{
    int index = [items indexOfObject:item];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    [self configureTextForCell:cell withChecklistItem:item];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"AddItem"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        ItemDetailViewController *controller = (ItemDetailViewController *)navigationController.topViewController;
        controller.delegate = self;
    } else if ([segue.identifier isEqualToString:@"EditItem"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        ItemDetailViewController *controller = (ItemDetailViewController *)navigationController.topViewController;
        controller.delegate = self;
        controller.itemToEdit = sender;
    }
}

@end
