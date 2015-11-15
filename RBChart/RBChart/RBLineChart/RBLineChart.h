//
//  RBLineChart.h
//  RBChart
//
//  Created by Shao.Tc on 15/7/5.
//  Copyright (c) 2015年 rainbow. All rights reserved.
//

#import "RBChart.h"
#import "RBLineDecorator.h"
#import "RBLineData.h"
#import "RBLineProtocol.h"
#import "RBLineSolidNode.h"
#import "RBLineHollowNode.h"
#import "RBLineChartDecorator.h"


@interface RBLineChart : RBChart
@property (assign, nonatomic) CGFloat maxValue;
@property (assign, nonatomic) BOOL autoMaxValue;
@property (assign, nonatomic) BOOL needHandlerTouch;
@property (strong, nonatomic) RBLineChartDecorator *chartDecorator;


- (void)setDatas:(NSArray *)datas titles:(NSArray *)titles;

- (NSArray *)showIndicatorAtIndex:(NSInteger)index;

- (void)handlerTouch:(ChartTouchHandler)touchHandler;
- (void)draw;
@end
