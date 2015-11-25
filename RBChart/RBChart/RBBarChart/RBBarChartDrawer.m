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

- (void)drawAtRect:(CGRect)rect canvas:(RBChartCanvas *)canvas {
    NSUInteger drawerIndex = [canvas.drawers indexOfObject:self];
    CGFloat spacing = (CGRectGetWidth(rect) - canvas.leading * 2) / (_datas.count - 1);
    NSUInteger i = 0;
    CGFloat barWidth = spacing / 2 / canvas.drawers.count;
    for (NSNumber *valuePoint in _datas) {
        CGFloat scale = valuePoint.floatValue / canvas.maxValue;
        CGPoint center = CGPointMake(canvas.leading + spacing * i, (1 - scale) * CGRectGetHeight(rect));
        i ++;
        
        CGFloat barHeight = CGRectGetHeight(rect) * scale;
        
        CGRect barFrame = CGRectMake(drawerIndex * barWidth + center.x - spacing / 4, CGRectGetHeight(rect) - barHeight, barWidth, barHeight);
        UIBezierPath *barPath = [UIBezierPath bezierPathWithRect:barFrame];
        [_bar decoratorPath:barPath];
        [_bar.barColor setStroke];
        [barPath stroke];
    }
}

@end
