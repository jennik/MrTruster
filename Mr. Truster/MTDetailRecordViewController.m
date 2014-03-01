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
}

- (IBAction)smsClicked:(id)sender {
}
@end
