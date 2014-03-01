//
//  MTDetailRecordViewController.m
//  Mr. Truster
//
//  Created by Ilya on 01.03.14.
//  Copyright (c) 2014 redbrush. All rights reserved.
//

#import "MTDetailRecordViewController.h"

@interface MTDetailRecordViewController ()

@end

@implementation MTDetailRecordViewController

@synthesize record;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@", self.record.comment);
	// Do any additional setup after loading the view.
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM dd"];
    
    self.createDateField.text = [formatter stringFromDate:self.record.dateCreated];
    self.itemPhotoField.image = record.itemPhoto;
    
    if (self.record.debitorPhoto) {
        self.debitorPhotoField.image = self.record.debitorPhoto;
    }
    
    if (self.record.contact) {
        NSString* name = (__bridge_transfer NSString*)ABRecordCopyValue(self.record.contact, kABPersonFirstNameProperty);
        NSString *lastname = (__bridge_transfer NSString*)ABRecordCopyValue(self.record.contact, kABPersonLastNameProperty);
        self.contactField.text = [NSString stringWithFormat:@"%@ %@", name, lastname];
    }
    
    if (self.record.dateBack) {
        self.dateBackField.text = [formatter stringFromDate:self.record.dateBack];
    }
    
    if (self.record.comment) {
        self.commentField.text = self.record.comment;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)returnedClicked:(id)sender {
}

- (IBAction)okClicked:(id)sender {
}

- (IBAction)dateClicked:(id)sender {
}

- (IBAction)contactsClicked:(id)sender {
}

- (IBAction)callClicked:(id)sender {
    NSString *number = (__bridge_transfer NSString*)ABRecordCopyValue(self.record.contact, kABPersonPhoneProperty);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", number]]];
}

- (IBAction)emailClicked:(id)sender {
    if([MFMailComposeViewController canSendMail]) {
        ABMultiValueRef emails = ABRecordCopyValue(self.record.contact, kABPersonEmailProperty);
        NSString* email = (__bridge NSString*)ABMultiValueCopyValueAtIndex(emails, 0);
        MFMailComposeViewController *mailCont = [[MFMailComposeViewController alloc] init];
        
        [mailCont setSubject:@"Ты мне кое-что должен :)"];
        [mailCont setToRecipients:[NSArray arrayWithObject:email]];
        [mailCont setMessageBody:@"Привет, когда вернешь ?" isHTML:NO];
        
        mailCont.mailComposeDelegate = self;
        [self presentViewController:mailCont animated:YES completion:nil];
    }
}

- (IBAction)smsClicked:(id)sender {
    if([MFMessageComposeViewController canSendText])
    {
        MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
        NSString *number = (__bridge_transfer NSString*)ABRecordCopyValue(self.record.contact, kABPersonPhoneProperty);
        
        controller.body = @"Привет, когда вернешь ?";
        controller.recipients = [NSArray arrayWithObject:[NSString stringWithFormat:@"tel:%@", number]];
        
        controller.messageComposeDelegate = self;
        [self presentViewController:controller animated:YES completion:nil];
    }
}

// DELEGATE METHODS

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error
{
    if(error) NSLog(@"ERROR - mailComposeController: %@", [error localizedDescription]);
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
