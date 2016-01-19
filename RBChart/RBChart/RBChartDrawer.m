//
//  RBCDrawer.m
//  RBChart
//
//  Created by Shao.Tc on 15/11/24.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import "RBChartDrawer.h"

@implementation RBChartDrawer

- (void)drawAtRect:(CGRect)rect canvas:(RBChartCanvas *)canvas showValues:(BOOL)showValues {
    
}

- (void)drawValue:(NSNumber *)value center:(CGPoint)center offset:(CGPoint)offset attributes:(NSDictionary *)attributes {
    NSString *valueString = [NSString stringWithFormat:@"%@", value];
    CGRect stringRect = [valueString boundingRectWithSize:CGSizeZero
                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                               attributes:attributes
                                                  context:nil];
    stringRect = CGRectOffset(stringRect, center.x - CGRectGetWidth(stringRect) / 2. - offset.x, center.y - CGRectGetHeight(stringRect) / 2. - offset.y);
    [valueString drawInRect:stringRect withAttributes:attributes];
}

@end
