//
//  RBChart.h
//  RBChart
//
//  Created by Shao.Tc on 15/11/24.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RBChartAxis.h"
#import "RBChartCanvas.h"
#import "RBChartDefines.h"

typedef NS_ENUM(NSUInteger, RBChartType) {
    RBDefaultLineChart,
    RBDefaultBarChart,
    RBDefaultPieChart,
};

@interface RBChart : UIView
@property (strong, nonatomic) RBChartCanvas *canvas;
@property (strong, nonatomic) RBChartAxis *xAxis;
@property (strong, nonatomic) RBChartAxis *yAxis;

@property (copy, nonatomic) RBChartTouchHandler touchHandler;

+ (instancetype)chartWithType:(RBChartType)type;
- (void)showValues:(BOOL)showValues;

@end
