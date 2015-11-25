//
//  RBChartBar.m
//  RBChart
//
//  Created by Shao.Tc on 15/11/24.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import "RBChartBar.h"

@implementation RBChartBar
kInitWithHandler_M

- (void)decoratorPath:(UIBezierPath *)path {
    [_barColor setFill];
    [path fill];
}

@end
