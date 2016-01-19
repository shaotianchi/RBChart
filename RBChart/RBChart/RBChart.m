//
//  RBChart.m
//  RBChart
//
//  Created by Shao.Tc on 15/11/24.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import "RBChart.h"

@interface RBLineChart : RBChart

@end

@interface RBBarChart : RBChart

@end

@interface RBPieChart : RBChart

@end

@interface RBChart ()
@property (assign, nonatomic) BOOL showValues;
@end

@implementation RBChart

+ (instancetype)chartWithType:(RBChartType)type {
    RBChart *chart = nil;
    switch (type) {
        case RBDefaultLineChart:
            chart = [RBLineChart new];
            break;
        case RBDefaultBarChart:
            chart = [RBBarChart new];
            break;
        case RBDefaultPieChart:
            chart = [RBPieChart new];
            break;
    }
    return chart;
}

- (void)setCanvas:(RBChartCanvas *)canvas {
    _canvas = canvas;
    self.backgroundColor = canvas.backgroundColor;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [_canvas drawAtRect:rect showValues:_showValues];
}

- (void)showValues:(BOOL)showValues {
    self.showValues = showValues;
    [self setNeedsDisplay];
}

#pragma mark - Touchs

- (void)setTouchHandler:(RBChartTouchHandler)touchHandler {
    _touchHandler = touchHandler;
    self.userInteractionEnabled = (_touchHandler != nil);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[touches allObjects] firstObject];
    [self chartBeTouched:touch];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[touches allObjects] firstObject];
    [self chartBeTouched:touch];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)chartBeTouched:(UITouch *)touch {
    CGPoint touchPoint = [touch locationInView:self];
    
    CGFloat spacing = (CGRectGetWidth(self.frame) - _canvas.leading * 2) / ([_canvas dataCount] - 1);
    NSInteger index = (touchPoint.x - _canvas.leading) / spacing;
    NSArray *touchedValues = [_canvas valuesAtIndex:index];
    !_touchHandler ?: _touchHandler(index, touchedValues);
}

@end

@implementation RBLineChart

@end

@implementation RBBarChart

@end

@implementation RBPieChart

@end
