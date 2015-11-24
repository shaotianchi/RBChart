//
//  RBLine.m
//  RBChart
//
//  Created by Shao.Tc on 15/11/15.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import "RBLine.h"

@interface RBLine ()
@property (nonnull, strong, nonatomic) UIBezierPath *linePath;
@end

@implementation RBLine

kRBChartInit

- (void)drawWithDecorator:(RBBaseChartDecorator *)decorator rect:(CGRect)rect {
    NSArray<NSNumber *> *values = self.values;
    CGFloat spacing = (CGRectGetWidth(rect) - decorator.leading * 2) / (decorator.dataCount - 1);
    CGPoint lastCenter = CGPointZero;
    for (int i = 0; i < values.count; i++) {
        NSNumber *value = values[i];
        CGFloat scale = value.floatValue / decorator.maxValue;
        CGPoint center = CGPointMake(decorator.leading + spacing * i, (1 - scale) * CGRectGetHeight(rect));
        CGRect rect = CGRectMake(center.x - _pointWidth / 2., center.y - _pointWidth / 2., _pointWidth, _pointWidth);
        [self.lineNode drawWithDecorator:decorator rect:rect];
        
        if (!CGPointEqualToPoint(CGPointZero, lastCenter)) {
            [self.linePath moveToPoint:lastCenter];
            [self.linePath addLineToPoint:center];
        }
        self.linePath.lineCapStyle = kCGLineCapRound;
        [_lineColor setStroke];
        self.linePath.lineWidth = _lineWidth;
        lastCenter = center;
        [self.linePath stroke];
    }
}

- (UIBezierPath *)linePath {
    if (!_linePath) {
        _linePath = [UIBezierPath bezierPath];
    }
    return _linePath;
}

@end
