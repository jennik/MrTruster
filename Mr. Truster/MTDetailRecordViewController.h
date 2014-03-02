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
#import <MessageUI/MFMessageComposeViewController.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface MTDetailRecordViewController : UIViewController <MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate, UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *itemPhotoField;
@property (weak, nonatomic) IBOutlet UIImageView *debitorPhotoField;
@property (weak, nonatomic) IBOutlet UITextField *contactField;
@property (weak, nonatomic) IBOutlet UITextField *dateBackField;
@property (weak, nonatomic) IBOutlet UITextView *commentField;
@property (weak, nonatomic) IBOutlet UITextField *createDateField;
@property (nonatomic) MTRecord *record;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;

- (IBAction)returnedClicked:(id)sender;
- (IBAction)okClicked:(id)sender;
- (IBAction)dateClicked:(id)sender;
- (IBAction)contactsClicked:(id)sender;
- (IBAction)callClicked:(id)sender;
- (IBAction)emailClicked:(id)sender;
- (IBAction)smsClicked:(id)sender;

@end
