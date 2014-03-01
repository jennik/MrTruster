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
