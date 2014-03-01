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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWIthItemPhoto:(UIImage *)itemPhoto debitorPhoto:(UIImage *)debitorPhoto contact:(ABRecordRef *)contact dateBack:(NSDate *)dateBack createDate:(NSDate *)createDate comment:(NSString *)comment {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM dd"];
    
    self.itemPhotoField.image = itemPhoto;
    self.debitorPhotoField.image = debitorPhoto;
    self.contactField.text = nil;
    self.dateBackField.text = [formatter stringFromDate:dateBack];
    self.createDateField.text = [formatter stringFromDate:createDate];
    self.commentField.text = comment;
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
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
@end
