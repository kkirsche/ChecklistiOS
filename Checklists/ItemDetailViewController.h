//
//  itemDetailViewController.h
//  Checklists
//
//  Created by Kevin Kirsche on 2/19/13.
//  Copyright (c) 2013 Kevin Kirsche. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ItemDetailViewController;
@class ChecklistItem;

@protocol ItemDetailViewControllerDelegate <NSObject>

- (void)itemDetailViewControllerDidCancel:(ItemDetailViewController *)controller;
- (void)itemDetailViewController:(ItemDetailViewController *)controller didFinishAddingItem:(ChecklistItem *)item;
- (void)itemDetailViewController:(ItemDetailViewController *)controller didFinishEditingItem:(ChecklistItem *)item;

@end

@interface ItemDetailViewController : UITableViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;
@property (weak, nonatomic) id<ItemDetailViewControllerDelegate> delegate;
@property (strong, nonatomic) ChecklistItem *itemToEdit;

- (IBAction)cancel;
- (IBAction)done;


@end
