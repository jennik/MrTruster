//
//  MTItem.h
//  Mr. Truster
//
//  Created by evg on 01.03.14.
//  Copyright (c) 2014 redbrush. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTRecord : NSObject

@property (nonatomic) NSDate *dateCreated;
@property (nonatomic) NSDate *dateBack;
@property (nonatomic) UIView *debtorPhoto;
@property (nonatomic) UIView *itemPhoto;

- (id)initWithDateBack:(NSDate *)backDate debitorPhoto:(UIImage *) debPhoto andItemPhoto:(UIImage *)itemPhoto;


@end
