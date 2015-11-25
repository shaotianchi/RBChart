//
//  RBPie.m
//  RBChart
//
//  Created by Shao.Tc on 15/11/25.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import "RBPie.h"

@interface RBPie ()
@property (assign, nonatomic) NSUInteger colorIndex;
@end

@implementation RBPie
kInitWithHandler_M

- (void)decoratorPath:(UIBezierPath *)path {
    [_colors[_colorIndex] setFill];
    [path fill];
    [_colors[_colorIndex] setStroke];
    [path stroke];
    _colorIndex ++;
    if (_colorIndex >= _colors.count) {
        _colorIndex = 0;
    }
}
@end
