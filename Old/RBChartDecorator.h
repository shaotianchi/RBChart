//
//  RBChartDecorator.h
//  RBChart
//
//  Created by 天池邵 on 15/7/15.
//  Copyright (c) 2015年 rainbow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RBChartDefines.h"
#import "RBChart.h"

@interface RBChartDecorator : NSObject
@property (strong, nonatomic) UIColor *backgroundColor;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (assign, nonatomic) CGFloat leading;

- (instancetype)initWithHandler:(RBChartInitHandler)handler;
- (void)drawIfNeed:(RBChart *)chart;
@end
