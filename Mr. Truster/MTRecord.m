//
//  MTItem.m
//  Mr. Truster
//
//  Created by evg on 01.03.14.
//  Copyright (c) 2014 redbrush. All rights reserved.
//

#import "MTRecord.h"

@implementation MTRecord

@synthesize dateBack, dateCreated, debitorPhoto, itemPhoto, comment, contact;

- (id)initWithDateBack:(NSDate *)backDate debitorPhoto:(UIImage *)debPhoto itemPhoto:(UIImage *)anItemPhoto comment:(NSString *)comment contact:(ABRecordRef)aContact {
    self.dateBack = backDate;
    self.debitorPhoto = debPhoto;
    self.itemPhoto = anItemPhoto;
    self.contact = aContact;
    self.dateCreated = [NSDate date];
    
    return self;
}

@end
