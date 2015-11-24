//
//  RBChartDecorator.m
//  RBChart
//
//  Created by Shao.Tc on 15/11/15.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import "RBBaseChartDecorator.h"
#import "NSArray+RBAddition.h"

@interface RBBaseChartDecorator ()
@end

@implementation RBBaseChartDecorator

- (instancetype)initWithHandler:(RBChartInitHandler)handler {
    self = [super init];
    if (self) {
        handler(self);
    }
    
    return self;
}

@synthesize dataCount = _dataCount, maxValue = _maxValue, elements = _elements, leading = _leading, boardBackgroundColor = _boardBackgroundColor, xAxis = _xAxis, yAxis = _yAxis;

- (void)setElements:(NSArray<id<RBChartElement>> *)elements {
    _elements = elements;
    NSArray *values = [_elements rb_map:^id(id<RBChartElement> element) {
        return [element values];
    }];
    
    self.dataCount = [[[values rb_map:^id(NSArray *innerValues) {
        return @(innerValues.count);
    }] rb_max] unsignedIntegerValue];
    
    if (self.maxValue == 0) {
        self.maxValue = [[[values rb_flatMap:^id(id object) {
            return object;
        }] rb_max] doubleValue];
    }
}

- (void)drawAtRect:(CGRect)rect {
    // Override
}

@end
