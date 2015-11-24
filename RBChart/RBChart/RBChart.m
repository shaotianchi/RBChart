//
//  RBChart.m
//  RBChart
//
//  Created by Shao.Tc on 15/11/24.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import "RBChart.h"

@implementation RBChart

- (void)setCanvas:(RBChartCanvas *)canvas {
    _canvas = canvas;
    self.backgroundColor = canvas.backgroundColor;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [_canvas drawIfNeed:rect];
}

@end
