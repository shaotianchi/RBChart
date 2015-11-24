//
//  RBLine.h
//  RBChart
//
//  Created by Shao.Tc on 15/11/24.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RBChartDefines.h"

typedef NS_ENUM(NSUInteger, RBLineType) {
    RBDefaultBlueLine,
    RBDefaultYellowLine,
    RBDefaultDashLine,
};

@interface RBLine : NSObject
@property (assign, nonatomic) CGFloat lineWidth;
@property (copy, nonatomic) UIColor *lineColor;

+ (instancetype)lineWithType:(RBLineType)type;
- (instancetype)initWithHandler:(RBChartInitHandler)handler;

- (void)decoratorPath:(UIBezierPath *)path;

@end
