//
//  MTCell.m
//  Mr. Truster
//
//  Created by evg on 01.03.14.
//  Copyright (c) 2014 redbrush. All rights reserved.
//

#import "MTCell.h"

@implementation MTCell

- (id)init
{
    if (self = [super init])
    {
        [[NSBundle mainBundle] loadNibNamed:@"Cell" owner:self options:nil];
    }
    return self;
}

@end
