//
//  MTAddMainViewController.m
//  Mr. Truster
//
//  Created by Ilya on 02.03.14.
//  Copyright (c) 2014 redbrush. All rights reserved.
//

#import "MTAddMainViewController.h"

@interface MTAddMainViewController ()

@end

@implementation MTAddMainViewController

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
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Device has no camera" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [myAlertView show];
        
    }
    self.record = [[MTRecord alloc] init];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)itemPhotoClicked:(id)sender {
    self.setItemPhoto = YES;
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)debitorPhotoClicked:(id)sender {
    self.setDebitorPhoto = YES;
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)giveClicked:(id)sender {
    MTMainViewController *cont = self.presentingViewController;
    
    [cont.records addObject:record];
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)detailClicked:(id)sender {
}

// DELEGATE METHODS

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    if (self.setDebitorPhoto) {
        self.record.debitorPhoto = chosenImage;
        self.setDebitorPhoto = NO;
    } else if (self.setItemPhoto) {
        self.record.itemPhoto = chosenImage;
        self.setItemPhoto = NO;
    }
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

@end
