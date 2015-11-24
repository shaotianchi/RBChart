//
//  RBChartDefines.h
//  RBChart
//
//  Created by Shao.Tc on 15/7/5.
//  Copyright (c) 2015年 rainbow. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^RBChartInitHandler)(id);
typedef void(^ChartTouchHandler)(NSInteger index, NSArray *values);

#define kRBChartInit - (instancetype)initWithHandler:(RBChartInitHandler)handler { \
                         self = [super init]; \
                         if (self) { \
                             handler(self); \
                         } \
                         return self; \
                     } \
