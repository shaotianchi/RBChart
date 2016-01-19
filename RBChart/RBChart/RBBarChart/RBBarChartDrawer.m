//
//  RBBarChartDrawer.m
//  RBChart
//
//  Created by Shao.Tc on 15/11/24.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import "RBBarChartDrawer.h"

@implementation RBBarChartDrawer
@synthesize datas = _datas;

kInitWithHandler_M

- (void)drawAtRect:(CGRect)rect canvas:(RBChartCanvas *)canvas showValues:(BOOL)showValues {
    NSUInteger drawerIndex = [canvas.drawers indexOfObject:self];
    CGFloat spacing = (CGRectGetWidth(rect) - canvas.leading * 2) / (_datas.count * canvas.drawers.count - 1);
    NSUInteger i = 0;
    CGFloat barWidth = spacing / 2;
    for (NSNumber *valuePoint in _datas) {
        CGFloat scale = valuePoint.floatValue / canvas.maxValue;
        CGPoint center = CGPointMake(canvas.leading + 2 * spacing * i, (1 - scale) * CGRectGetHeight(rect));
        i ++;
        
        CGFloat barHeight = CGRectGetHeight(rect) * scale;
        CGRect barFrame = CGRectMake(barWidth * drawerIndex + center.x, center.y, barWidth, barHeight);
        UIBezierPath *barPath = [UIBezierPath bezierPathWithRect:barFrame];
        [_bar decoratorPath:barPath];
        
        if (showValues) {
            [self drawValue:valuePoint center:CGPointMake(CGRectGetMidX(barFrame), CGRectGetMinY(barFrame)) offset:CGPointMake(0, 10) attributes:canvas.valueStringAttributes];
        }
    }
}

@end
