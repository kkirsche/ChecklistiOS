//
//  ChecklistsViewController.m
//  Checklists
//
//  Created by Kevin Kirsche on 2/18/13.
//  Copyright (c) 2013 Kevin Kirsche. All rights reserved.
//

#import "ChecklistsViewController.h"

@interface ChecklistsViewController ()

@end

@implementation ChecklistsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    
    //dynamically change our prototype's cell label's text to the respective text based on which row it is in.
    if (indexPath.row % 5 == 0) {
        label.text = @"Walk the dog";
    } else if (indexPath.row % 5 == 1) {
        label.text = @"Brush my teeth";
    } else if (indexPath.row % 5 == 2) {
        label.text = @"Learn iOS Development";
    } else if (indexPath.row % 5 == 3) {
        label.text = @"Soccer Practice";
    } else if (indexPath.row % 5 == 4) {
        label.text = @"Eat ice cream";
    }
    
    return cell;
}

@end
