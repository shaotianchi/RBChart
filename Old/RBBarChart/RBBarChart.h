//
//  RBBarChart.h
//  RBChart
//
//  Created by 天池邵 on 15/7/15.
//  Copyright (c) 2015年 rainbow. All rights reserved.
//

#import "RBChart.h"
#import "RBChartDefines.h"
#import "RBBarDecorator.h"
#import "RBBarData.h"
#import "RBChartDecorator.h"

@interface RBBarChart : RBChart
@property (assign, nonatomic) CGFloat maxValue;
@property (assign, nonatomic) BOOL autoMaxValue;
@property (assign, nonatomic) BOOL needHandlerTouch;
@property (strong, nonatomic) RBChartDecorator *chartDecorator;

- (void)setDatas:(NSArray *)datas titles:(NSArray *)titles;

- (NSArray *)showIndicatorAtIndex:(NSInteger)index;

- (void)handlerTouch:(ChartTouchHandler)touchHandler;
- (void)draw;
@end
