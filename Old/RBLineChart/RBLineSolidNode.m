//
//  RBLineNode.m
//  RBChart
//
//  Created by 天池邵 on 15/7/15.
//  Copyright (c) 2015年 rainbow. All rights reserved.
//

#import "RBLineSolidNode.h"

@implementation RBLineSolidNode
@synthesize values = _values;

- (instancetype)initWithHandler:(RBChartInitHandler)handler {
    self = [super init];
    if (self) {
        !handler ?: handler(self);
    }
    return self;
}

- (void)drawWithDecorator:(id<RBChartDecorator>)decorator rect:(CGRect)rect {
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect:rect];
    [_fillColor setFill];
    [ovalPath fill];
    [_strokeColor setStroke];
    [ovalPath stroke];
}

@end
