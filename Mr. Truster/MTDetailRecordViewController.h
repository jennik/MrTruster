//
//  MTDetailRecordViewController.h
//  Mr. Truster
//
//  Created by Ilya on 01.03.14.
//  Copyright (c) 2014 redbrush. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>

@interface MTDetailRecordViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *itemPhotoField;
@property (weak, nonatomic) IBOutlet UIImageView *debitorPhotoField;
@property (weak, nonatomic) IBOutlet UITextField *contactField;
@property (weak, nonatomic) IBOutlet UITextField *dateBackField;
@property (weak, nonatomic) IBOutlet UITextView *commentField;
@property (weak, nonatomic) IBOutlet UITextField *createDateField;

- (IBAction)returnedClicked:(id)sender;
- (IBAction)okClicked:(id)sender;
- (IBAction)dateClicked:(id)sender;
- (IBAction)contactsClicked:(id)sender;

- (id)initWIthItemPhoto:(UIImageView *)itemPhoto debitorPhoto:(UIImageView *)debitorPhoto contact:(ABRecordRef *)contact dateBack:(NSDate *)dateBack createDate:(NSDate *)createDate comment:(NSString *)comment;

@end
