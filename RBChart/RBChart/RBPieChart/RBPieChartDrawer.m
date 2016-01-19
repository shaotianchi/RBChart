//
//  RBPieChartDrawer.m
//  RBChart
//
//  Created by Shao.Tc on 15/11/25.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import "RBPieChartDrawer.h"
#import "NSArray+RBAddition.h"

@interface RBPieChartDrawer ()
@property (assign, nonatomic) CGFloat total;
@end

@implementation RBPieChartDrawer
kInitWithHandler_M

- (void)drawAtRect:(CGRect)rect canvas:(RBChartCanvas *)canvas showValues:(BOOL)showValues {
    [_pie resetColorIndex];
    CGFloat lastAngle = 0;
    CGPoint rectCenter = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
    for (NSNumber *number in self.datas) {
        CGFloat value = [number doubleValue];
        CGFloat scale = value / self.total;
        CGFloat angle = scale * M_PI * 2 + lastAngle;
        UIBezierPath *piePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect)) radius:80 startAngle:lastAngle endAngle:angle clockwise:YES];
        [piePath addLineToPoint:rectCenter];
        [_pie decoratorPath:piePath];
        
        if (showValues) {
            NSLog(@"%@", NSStringFromCGRect(piePath.bounds));
            CGFloat halfAngle = (angle + lastAngle) / 2.;
            
            [self drawValue:number center:CGPointMake((cos(halfAngle) * 80 / 2. + rectCenter.x), (sin(halfAngle) * 80 / 2. + rectCenter.y)) offset:CGPointZero attributes:canvas.valueStringAttributes];
        }
        lastAngle = angle;
    }
}

- (CGFloat)total {
    if (_total <= 0) {
        _total = [[self.datas rb_sum] doubleValue];
    }
    return _total;
}

@end
