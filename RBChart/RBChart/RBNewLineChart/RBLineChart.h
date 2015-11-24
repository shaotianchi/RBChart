//
//  RBLineChart.h
//  RBChart
//
//  Created by Shao.Tc on 15/11/18.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RBChartProtocols.h"
@class RBLine, RBLineChartDecorator;

@interface RBLineChart : UIView <RBChart>
@property (nonnull, strong, nonatomic) NSArray<RBLine *> *lines;
- (void)draw;

@end
