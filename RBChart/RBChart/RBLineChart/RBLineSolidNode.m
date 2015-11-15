//
//  RBLineNode.m
//  RBChart
//
//  Created by 天池邵 on 15/7/15.
//  Copyright (c) 2015年 rainbow. All rights reserved.
//

#import "RBLineSolidNode.h"

@implementation RBLineSolidNode

- (instancetype)initWithHandler:(RBChartInitHandler)handler {
    self = [super init];
    if (self) {
        !handler ?: handler(self);
    }
    return self;
}

- (void)drawNodeAtRect:(CGRect)rect {
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect:rect];
    [_fillColor setFill];
    [ovalPath fill];
    [_strokeColor setStroke];
    [ovalPath stroke];
}

@end
