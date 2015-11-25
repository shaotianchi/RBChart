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

kInitWithHandler_M

- (void)drawAtRect:(CGRect)rect canvas:(RBChartCanvas *)canvas {
    CGFloat spacing = (CGRectGetWidth(rect) - canvas.leading * 2) / (_datas.count - 1);
    NSUInteger i = 0;
    CGPoint lastCenter = CGPointZero;
    for (NSNumber *valuePoint in _datas) {
        CGFloat scale = valuePoint.floatValue / canvas.maxValue;
        CGPoint center = CGPointMake(canvas.leading + spacing * i, (1 - scale) * CGRectGetHeight(rect));
        i ++;
        
        CGRect rect =  CGRectMake(center.x - _node.nodeWidth / 2., center.y - _node.nodeWidth / 2., _node.nodeWidth, _node.nodeWidth);
        UIBezierPath *nodePath = [UIBezierPath bezierPathWithOvalInRect:rect];
        [_node decoratorPath:nodePath];
        [_node.nodeColor setStroke];
        [nodePath stroke];
        
        if (!CGPointEqualToPoint(lastCenter, CGPointZero)) {
            LinePoints linePoints = [_node linePointsWithCenter:center lastCenter:lastCenter];
            
            UIBezierPath *linePath = [UIBezierPath bezierPath];
            [linePath moveToPoint:linePoints.beginPoint];
            [linePath addLineToPoint:linePoints.endPoint];
            [_line decoratorPath:linePath];
            [_line.lineColor setStroke];
            [linePath stroke];
        }
        
        lastCenter = center;
    }
    
}

@end
