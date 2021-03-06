//
//  RBLineHollowNode.m
//  RBChart
//
//  Created by 天池邵 on 15/7/15.
//  Copyright (c) 2015年 rainbow. All rights reserved.
//

#import "RBLineHollowNode.h"
#import "RBBaseChartDecorator.h"

@implementation RBLineHollowNode
@synthesize values = _values;

- (instancetype)initWithHandler:(RBChartInitHandler)handler {
    self = [super init];
    if (self) {
        !handler ?: handler(self);
    }
    
    return self;
}

- (void)drawWithDecorator:(RBBaseChartDecorator *)decorator rect:(CGRect)rect {
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect:rect];
    [[UIColor clearColor] setFill];
    [ovalPath fill];
    ovalPath.lineWidth = _lineWidth;
    [_strokeColor setStroke];
    [ovalPath stroke];
}

@end
