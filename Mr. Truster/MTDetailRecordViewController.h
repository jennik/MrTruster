//
//  MTDetailRecordViewController.h
//  Mr. Truster
//
//  Created by Ilya on 01.03.14.
//  Copyright (c) 2014 redbrush. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>
#import "MTRecord.h"

@interface MTDetailRecordViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *itemPhotoField;
@property (weak, nonatomic) IBOutlet UIImageView *debitorPhotoField;
@property (weak, nonatomic) IBOutlet UITextField *contactField;
@property (weak, nonatomic) IBOutlet UITextField *dateBackField;
@property (weak, nonatomic) IBOutlet UITextView *commentField;
@property (weak, nonatomic) IBOutlet UITextField *createDateField;
@property (nonatomic) MTRecord *record;

- (IBAction)returnedClicked:(id)sender;
- (IBAction)okClicked:(id)sender;
- (IBAction)dateClicked:(id)sender;
- (IBAction)contactsClicked:(id)sender;

@end
