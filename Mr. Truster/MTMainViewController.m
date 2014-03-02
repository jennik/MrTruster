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
#include "MTDetailRecordViewController.h"
#import "MTHeaderCell.h"
#import "MTAddMainViewController.h"

@interface MTMainViewController ()

@end

@implementation MTMainViewController

@synthesize records, whom, table;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

        NSDate *date = [NSDate date];
        
        
        CFErrorRef err;
        ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, &err);
        ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
        });
        CFArrayRef allPeople = ABAddressBookCopyArrayOfAllPeople(addressBook);
        ABRecordRef ref = CFArrayGetValueAtIndex(allPeople, 1);
        
        UIImage *item_img1 = [UIImage imageNamed:@"item_img1.jpg"];
        UIImage *item_img2 = [UIImage imageNamed:@"item_img2.jpg"];
        UIImage *item_img3 = [UIImage imageNamed:@"item_img3.jpg"];
        UIImage *item_img4 = [UIImage imageNamed:@"item_img4.jpg"];
        UIImage *item_img5 = [UIImage imageNamed:@"item_img5.jpg"];
        
        UIImage *deb_img1 = [UIImage imageNamed:@"deb_img1.jpg"];
        UIImage *deb_img2 = [UIImage imageNamed:@"deb_img2.jpg"];
        UIImage *deb_img3 = [UIImage imageNamed:@"deb_img3.jpg"];
        UIImage *deb_img4 = [UIImage imageNamed:@"deb_img4.jpg"];
        UIImage *deb_img5 = [UIImage imageNamed:@"deb_img5.jpg"];
        
        MTRecord *item1 = [[MTRecord alloc] initWithDateBack:[NSDate dateWithTimeIntervalSinceNow:24*60*60*3] debitorPhoto:deb_img1 itemPhoto:item_img1 comment:@"Plz giv ma stuff" contact:ref];
        MTRecord *item2 = [[MTRecord alloc] initWithDateBack:[NSDate dateWithTimeIntervalSinceNow:24*60*60*2] debitorPhoto:deb_img2 itemPhoto:item_img2 comment:@"Plz giv ma stuff" contact:ref];
        MTRecord *item3 = [[MTRecord alloc] initWithDateBack:date debitorPhoto:deb_img3 itemPhoto:item_img3 comment:@"Plz giv ma stuff" contact:ref];
        MTRecord *item4 = [[MTRecord alloc] initWithDateBack:date debitorPhoto:deb_img4 itemPhoto:item_img4 comment:@"Plz giv ma stuff" contact:ref];
        MTRecord *item5 = [[MTRecord alloc] initWithDateBack:[NSDate dateWithTimeIntervalSinceNow:24*60*60] debitorPhoto:deb_img5 itemPhoto:item_img5 comment:@"Plz giv ma stuff" contact:ref];
        
        records = [NSMutableArray arrayWithObjects:item1, item2, item3, item4, item5, nil];
        NSLog(@"%@", item1.comment);
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UINib *nib = [UINib nibWithNibName:@"MTCell" bundle:nil];
    [self.table registerNib:nib forCellReuseIdentifier:@"MTCell"];
    
    nib = [UINib nibWithNibName:@"MTHeaderCell" bundle:nil];
    [self.table registerNib:nib forCellReuseIdentifier:@"MTHeaderCell"];
}

+ (NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime
{
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&fromDate
                 interval:NULL forDate:fromDateTime];
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&toDate
                 interval:NULL forDate:toDateTime];
    
    NSDateComponents *difference = [calendar components:NSDayCalendarUnit
                                               fromDate:fromDate toDate:toDate options:0];
    
    return [difference day];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.records count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != 0)
    {
        MTCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MTCell"];
        NSInteger index = indexPath.row - 1;
        MTRecord *record = [self.records objectAtIndex:index];
        
        cell.what.image = [record debitorPhoto];
        cell.who.photo = record.itemPhoto;
        
        
        if ([[NSDate date] compare:record.dateBack] == NSOrderedDescending)
        {
            cell.when.text = @"Просрочен";
            cell.when.textColor = [UIColor redColor];
        }
        else
        {
            
            if ([[NSDate dateWithTimeIntervalSinceNow:60*60*24*2] compare:record.dateBack] == NSOrderedAscending)
            {
                cell.when.text = [[NSString alloc] initWithFormat:@"%ld дня", (long)[[self class] daysBetweenDate:[NSDate date] andDate:record.dateBack]];
                cell.when.textColor = [UIColor blackColor];
            }
            else
            {
                NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
                [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
                NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
                [dateFormatter setLocale:locale];
                [dateFormatter setDoesRelativeDateFormatting:YES];
                cell.when.text = [dateFormatter stringFromDate:record.dateBack];
                cell.when.textColor = [UIColor colorWithRed:0x75/255.0 green:0xC5/255.0 blue:0x3E/255.0 alpha:1.0f];
            }
            
        }
        return cell;
    }
    else
    {
        MTHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MTHeaderCell"];
        cell.userInteractionEnabled = NO;
        cell.debitorsButton.backgroundColor = [UIColor colorWithRed:0.251f green:0.255f blue:0.298f alpha:1.0f];
        return cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 41.0f;
    }
    return 90.0f;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 41.0f;
//}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    return [[[NSBundle mainBundle] loadNibNamed:@"tableHeader" owner:self options:nil] objectAtIndex:0];
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MTDetailRecordViewController *detailView = [[MTDetailRecordViewController alloc] init];
    detailView.record = [self.records objectAtIndex:indexPath.row - 1];
    [self.navigationController pushViewController:detailView animated:YES];
}

- (IBAction)take:(id)sender
{
    MTAddMainViewController *addView = [[MTAddMainViewController alloc] init];
    
    [self.navigationController pushViewController:addView animated:YES];
}
@end
