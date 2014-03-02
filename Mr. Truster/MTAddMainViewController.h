//
//  MTAddMainViewController.h
//  Mr. Truster
//
//  Created by Ilya on 02.03.14.
//  Copyright (c) 2014 redbrush. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTRecord.h"
#import "MTMainViewController.h"

@interface MTAddMainViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic) MTRecord* record;
@property (nonatomic) BOOL setDebitorPhoto;
@property (nonatomic) BOOL setItemPhoto;
@property (weak, nonatomic) IBOutlet UIImageView *itemPhotoField;
@property (weak, nonatomic) IBOutlet UIImageView *debitorPhotoField;
@property (weak, nonatomic) IBOutlet UILabel *currentDateField;
@property (weak, nonatomic) IBOutlet UILabel *currentTimeDayField;

- (IBAction)itemPhotoClicked:(id)sender;
- (IBAction)debitorPhotoClicked:(id)sender;
- (IBAction)giveClicked:(id)sender;
- (IBAction)detailClicked:(id)sender;

@end
