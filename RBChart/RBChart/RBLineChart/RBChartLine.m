//
//  RBLine.m
//  RBChart
//
//  Created by Shao.Tc on 15/11/24.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import "RBChartLine.h"

@interface RBDashLine : RBChartLine

@end

@implementation RBDashLine

- (void)decoratorPath:(UIBezierPath *)path {
    CGFloat dashes[] = {4, 2};
    [path setLineDash:dashes count:2 phase:0];
    [super decoratorPath:path];
}

@end

@implementation RBChartLine

kInitWithHandler_M

+ (instancetype)lineWithType:(RBLineType)type {
    RBChartLine *line = nil;
    switch (type) {
        case RBDefaultBlueLine:
            line = [[RBChartLine alloc] initWithHandler:^(RBChartLine *line) {
                line.lineColor = kRBDefaultBlue;
                line.lineWidth = 2.;
            }];
            break;
        case RBDefaultYellowLine:
            line = [[RBChartLine alloc] initWithHandler:^(RBChartLine *line) {
                line.lineColor = kRBDefaultYellow;
                line.lineWidth = 2.;
            }];
            break;
        case RBDefaultDashLine:
            line = [[RBDashLine alloc] initWithHandler:^(RBDashLine *dashLine) {
                dashLine.lineColor = kRBDefaultBlue;
                dashLine.lineWidth = 2.;
            }];
            break;
    }
    
    return line;
}

- (void)decoratorPath:(UIBezierPath *)path {
    path.lineWidth = _lineWidth;
}

@end
