//
//  ChecklistsViewController.h
//  Checklists
//
//  Created by Kevin Kirsche on 2/18/13.
//  Copyright (c) 2013 Kevin Kirsche. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddItemViewController.h"

@interface ChecklistsViewController : UITableViewController <AddItemViewControllerDelegate>

- (IBAction)addItem;

@end
