//
//  MTMainViewController.m
//  Mr. Truster
//
//  Created by evg on 01.03.14.
//  Copyright (c) 2014 redbrush. All rights reserved.
//

#import "MTMainViewController.h"
#import "MTRecord.h"
#import "MTCell.h"

@interface MTMainViewController ()

@end

@implementation MTMainViewController

@synthesize records, irecords, table;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

        NSDate *date = [NSDate date];
        ABAddressBookRef addressBook = ABAddressBookCreate();
        CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(addressBook);
        ABRecordRef ref = CFArrayGetValueAtIndex(allPeople, 1);
        
        UIImage *item_img1 = [UIImage imageNamed:@"item_img1"];
        UIImage *item_img2 = [UIImage imageNamed:@"item_img2"];
        UIImage *item_img3 = [UIImage imageNamed:@"item_img3"];
        UIImage *item_img4 = [UIImage imageNamed:@"item_img4"];
        UIImage *item_img5 = [UIImage imageNamed:@"item_img5"];
        
        UIImage *deb_img1 = [UIImage imageNamed:@"deb_img1"];
        UIImage *deb_img2 = [UIImage imageNamed:@"deb_img2"];
        UIImage *deb_img3 = [UIImage imageNamed:@"deb_img3"];
        UIImage *deb_img4 = [UIImage imageNamed:@"deb_img4"];
        UIImage *deb_img5 = [UIImage imageNamed:@"deb_img5"];
        
        MTRecord *item1 = [[MTRecord alloc] initWithDateBack:date debitorPhoto:deb_img1 itemPhoto:item_img1 comment:@"Plz giv ma stuff" contact:ref];
        MTRecord *item2 = [[MTRecord alloc] initWithDateBack:date debitorPhoto:deb_img2 itemPhoto:item_img2 comment:@"Plz giv ma stuff" contact:ref];
        MTRecord *item3 = [[MTRecord alloc] initWithDateBack:date debitorPhoto:deb_img3 itemPhoto:item_img3 comment:@"Plz giv ma stuff" contact:ref];
        MTRecord *item4 = [[MTRecord alloc] initWithDateBack:date debitorPhoto:deb_img4 itemPhoto:item_img4 comment:@"Plz giv ma stuff" contact:ref];
        MTRecord *item5 = [[MTRecord alloc] initWithDateBack:date debitorPhoto:deb_img5 itemPhoto:item_img5 comment:@"Plz giv ma stuff" contact:ref];
        
        records = [NSMutableArray arrayWithObjects:item1, item2, item3, item4, item5, nil];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UINib *nib = [UINib nibWithNibName:@"MTCell" bundle:nil];
    
    [self.table registerNib:nib forCellReuseIdentifier:@"MTCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.records count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MTCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MTCell"];
    NSInteger index = indexPath.row;
    
    cell.what.image = [[self.records objectAtIndex:index] itemPhoto];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0f;
}

@end
