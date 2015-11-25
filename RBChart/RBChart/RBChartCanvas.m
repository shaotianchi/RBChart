//
//  RBChartCanvas.m
//  RBChart
//
//  Created by Shao.Tc on 15/11/24.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import "RBChartCanvas.h"
#import "NSArray+RBAddition.h"
#import "RBChartDrawer.h"

@interface RBChartGridCanvas : RBChartCanvas
@property (strong, nonatomic) UIBezierPath *middlePath;
@end

@implementation RBChartGridCanvas

- (void)drawIfNeed:(CGRect)rect {
    [self.middlePath moveToPoint:CGPointMake(0, CGRectGetHeight(rect) / 2.)];
    [self.middlePath addLineToPoint:CGPointMake(CGRectGetWidth(rect), CGRectGetHeight(rect) / 2.)];
    [[UIColor whiteColor] setStroke];
    [self.middlePath stroke];
    
    NSUInteger dataCount = [[[self.drawers rb_map:^id(RBChartDrawer *drawer) {
        return @(drawer.datas.count);
    }] rb_max] unsignedIntegerValue];
    
    CGFloat spacing = (CGRectGetWidth(rect) - self.leading * 2) / (dataCount - 1);
    for (NSUInteger i = 0; i < dataCount; i ++) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        path.lineWidth = .5;
        CGFloat x = self.leading + spacing * i;
        [path moveToPoint:CGPointMake(x, 0)];
        [path addLineToPoint:CGPointMake(x, CGRectGetWidth(rect))];
        [[UIColor whiteColor] setStroke];
        [path stroke];
    }
    [super drawIfNeed:rect];
}

- (UIBezierPath *)middlePath {
    if (!_middlePath) {
        _middlePath = [UIBezierPath bezierPath];
        _middlePath.lineWidth = .5;
    }
    return _middlePath;
}

@end

@implementation RBChartCanvas

+ (instancetype)canvasWithType:(RBChartCanvasType)type {
    RBChartCanvas *canvas = nil;
    switch (type) {
        case RBDefaultCanvas:
            canvas = [RBChartCanvas new];
            break;
        case RBGridCanvas:
            canvas = [RBChartGridCanvas new];
            break;
        default:
            break;
    }
    
    return canvas;
}

- (void)setDrawers:(NSArray<RBChartDrawer *> *)drawers {
    _drawers = drawers;
    
}

- (void)drawIfNeed:(CGRect)rect {
    for (RBChartDrawer *drawer in _drawers) {
        [drawer drawAtRect:rect canvas:self];
    }
}

- (void)setupProperty:(RBChartInitHandler)handler {
    handler(self);
}


@end
