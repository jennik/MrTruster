//
//  MTCell.h
//  Mr. Truster
//
//  Created by evg on 01.03.14.
//  Copyright (c) 2014 redbrush. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTCircleView.h"

@interface MTCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *what;
@property (weak, nonatomic) IBOutlet MTCircleView *who;
@property (weak, nonatomic) IBOutlet UILabel *when;
@property (weak, nonatomic) IBOutlet UIButton *backed;

@end
