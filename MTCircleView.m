//
//  MTCircleView.m
//  Mr. Truster
//
//  Created by evg on 01.03.14.
//  Copyright (c) 2014 redbrush. All rights reserved.
//

#import "MTCircleView.h"

@implementation MTCircleView

- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextAddArc(ctx, rect.origin.x + rect.size.width / 2, rect.origin.y + rect.size.height / 2, rect.size.height / 2, 0, 2 * M_PI, YES);
    
    CGContextDrawPath(ctx, kCGPathFill);
}

@end
