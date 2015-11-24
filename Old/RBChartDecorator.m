//
//  RBChartDecorator.m
//  RBChart
//
//  Created by 天池邵 on 15/7/15.
//  Copyright (c) 2015年 rainbow. All rights reserved.
//

#import "RBChartDecorator.h"

@implementation RBChartDecorator
- (instancetype)initWithHandler:(RBChartInitHandler)handler {
    self = [super init];
    if (self) {
        !handler ?: handler(self);
    }
    
    return self;
}

- (void)drawIfNeed:(RBChart *)chart {
    
}
@end
