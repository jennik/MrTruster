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
#import "MTCircleView.h"

@interface MTAddMainViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic) MTRecord* record;
@property (nonatomic) BOOL setDebitorPhoto;
@property (nonatomic) BOOL setItemPhoto;
@property (weak, nonatomic) IBOutlet UIImageView *itemPhotoField;
@property (weak, nonatomic) IBOutlet MTCircleView *debitorPhotoField;
@property (weak, nonatomic) IBOutlet UILabel *currentDateField;
@property (weak, nonatomic) IBOutlet UILabel *currentTimeDayField;
@property (weak, nonatomic) IBOutlet UIImageView *debitorPictogram;
@property (weak, nonatomic) IBOutlet UIImageView *itemPictogram;

- (IBAction)itemPhotoClicked:(id)sender;
- (IBAction)debitorPhotoClicked:(id)sender;
- (IBAction)giveClicked:(id)sender;
- (IBAction)detailClicked:(id)sender;

@end
