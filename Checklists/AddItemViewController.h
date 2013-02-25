//
//  AddItemViewController.h
//  Checklists
//
//  Created by Kevin Kirsche on 2/19/13.
//  Copyright (c) 2013 Kevin Kirsche. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddItemViewController;
@class ChecklistItem;

@protocol AddItemViewControllerDelegate <NSObject>

- (void)addItemViewControllerDidCancel:(AddItemViewController *)controller;
- (void)addItemViewController:(AddItemViewController *)controller didFinishAddingItem:(ChecklistItem *)item;
- (void)addItemViewController:(AddItemViewController *)controller didFinishEditingItem:(ChecklistItem *)item;

@end

@interface AddItemViewController : UITableViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;
@property (weak, nonatomic) id<AddItemViewControllerDelegate> delegate;
@property (strong, nonatomic) ChecklistItem *itemToEdit;

- (IBAction)cancel;
- (IBAction)done;


@end
