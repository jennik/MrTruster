//
//  MTItem.h
//  Mr. Truster
//
//  Created by evg on 01.03.14.
//  Copyright (c) 2014 redbrush. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBookUI/AddressBookUI.h>

@interface MTRecord : NSObject

@property (nonatomic) NSDate *dateCreated;
@property (nonatomic) NSDate *dateBack;
@property (nonatomic) UIImage *debitorPhoto;
@property (nonatomic) UIImage *itemPhoto;
@property (nonatomic) NSString *comment;
@property (nonatomic) ABRecordRef contact;

- (id)initWithDateBack:(NSDate *)backDate debitorPhoto:(UIImage *)debPhoto itemPhoto:(UIImage *)itemPhoto comment:(NSString *)comment contact:(ABRecordRef)contact;


@end
