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
    
    [_canvas drawIfNeed:rect];
}

@end

@implementation RBLineChart

@end

@implementation RBBarChart

@end

@implementation RBPieChart

@end
