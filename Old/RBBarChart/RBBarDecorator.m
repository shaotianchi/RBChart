//
//  RBBarDecorator.m
//  RBChart
//
//  Created by 天池邵 on 15/7/15.
//  Copyright (c) 2015年 rainbow. All rights reserved.
//

#import "RBBarDecorator.h"

@implementation RBBarDecorator

- (void)drawBarAtRect:(CGRect)rect {
    UIBezierPath *rectPath = [UIBezierPath bezierPathWithRect:rect];
    [_barColor setFill];
    [rectPath fill];
}

@end
