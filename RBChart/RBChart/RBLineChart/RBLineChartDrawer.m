//
//  RBLineChartDrawer.m
//  RBChart
//
//  Created by Shao.Tc on 15/11/24.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import "RBLineChartDrawer.h"
#import "RBChartCanvas.h"

@interface RBLineChartDrawer ()

@end

@implementation RBLineChartDrawer
@synthesize datas = _datas;

kInitWithHandler

- (void)drawAtRect:(CGRect)rect canvas:(RBChartCanvas *)canvas {
    CGFloat spacing = (CGRectGetWidth(rect) - canvas.leading * 2) / (_datas.count - 1);
    NSUInteger i = 0;
    CGPoint lastCenter = CGPointZero;
    for (NSNumber *valuePoint in _datas) {
        CGFloat scale = valuePoint.floatValue / canvas.maxValue;
        CGPoint center = CGPointMake(canvas.leading + spacing * i, (1 - scale) * CGRectGetHeight(rect));
        i ++;
        
        UIBezierPath *nodePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(center.x - _node.nodeWidth / 2., center.y - _node.nodeWidth / 2., _node.nodeWidth, _node.nodeWidth)];
        [_node.nodeColor setStroke];
        [_node decoratorPath:nodePath];
        
        if (!CGPointEqualToPoint(lastCenter, CGPointZero)) {
            CGFloat dx = center.x - lastCenter.x;
            CGFloat dy = center.y - lastCenter.y;
            CGFloat r = _node.nodeWidth / 2.;
            CGFloat distance = sqrt(pow(dx, 2) + pow(dy, 2));
            
            UIBezierPath *linePath = [UIBezierPath bezierPath];
            [linePath moveToPoint: CGPointMake(lastCenter.x + (dx * r) / distance,
                                               lastCenter.y + (dy * r) / distance)];
            [linePath addLineToPoint: CGPointMake(center.x - (dx * r) / distance,
                                                  center.y - (dy * r) / distance)];
            [_line decoratorPath:linePath];
        }
        
        lastCenter = center;
    }
    
}

@end
