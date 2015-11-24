//
//  RBLineChartDecorator.m
//  RBChart
//
//  Created by Shao.Tc on 15/11/18.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import "RBLineChartDecorator.h"

@interface RBLineChartDecorator ()

@property (assign, nonatomic) CGFloat spacing;

@end

@implementation RBLineChartDecorator

- (void)drawAtRect:(CGRect)rect {
    
    for (id<RBChartElement> element in self.elements) {
        [element drawWithDecorator:self rect:rect];
    }
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, CGRectGetHeight(rect) / 2)];
    [path addLineToPoint:CGPointMake(CGRectGetWidth(rect), CGRectGetHeight(rect) / 2)];
    path.lineWidth = .5;
    
    for (int i = 0; i < self.dataCount; i ++) {
        CGFloat spacing = [self spacingAtRect:rect];
        CGFloat x = self.leading + spacing * i;
        [path moveToPoint:CGPointMake(x, 0)];
        [path addLineToPoint:CGPointMake(x, CGRectGetHeight(rect))];
    }
    
    [[UIColor whiteColor] setStroke];
    [path stroke];
}

- (CGFloat)spacingAtRect:(CGRect)rect {
    if (_spacing == 0) {
        _spacing = (CGRectGetWidth(rect) - self.leading * 2) / (self.dataCount - 1);
    }
    return _spacing;
}

- (NSArray *)valuesAtIndex:(NSUInteger)index {
    NSMutableArray *values = [NSMutableArray array];
    for (id<RBChartElement> element in self.elements) {
        if (element.values.count <= index) {
            continue;
        }
        
        [values addObject:element.values[index]];
    }
    return values;
}

@end
