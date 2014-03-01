//
//  MTMainViewController.h
//  Mr. Truster
//
//  Created by evg on 01.03.14.
//  Copyright (c) 2014 redbrush. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTMainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) NSMutableArray *irecords;
@property (nonatomic) NSMutableArray *records;

@property (weak, nonatomic) IBOutlet UIButton *borrow;
@property (weak, nonatomic) IBOutlet UIButton *lend;
@property (weak, nonatomic) IBOutlet UITableView *table;

@end
