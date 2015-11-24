//
//  RBChartDefines.h
//  RBChart
//
//  Created by Shao.Tc on 15/11/24.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^RBChartInitHandler)(id);
typedef void(^ChartTouchHandler)(NSInteger index, NSArray *values);

#define kInitWithHandler - (instancetype)initWithHandler:(RBChartInitHandler)handler {  \
                             self = [super init];                                       \
                             if (self) {                                                \
                                 handler(self);                                         \
                             }                                                          \
                             return self;                                               \
                         }   
#define kRBDefaultChartBackgroundColor [UIColor colorWithRed:0.300 green:0.382 blue:0.715 alpha:1.000]
#define kRBDefaultBlue [UIColor colorWithRed:0.095 green:0.744 blue:0.911 alpha:1.000]
#define kRBDefaultYellow [UIColor colorWithRed:0.911 green:0.902 blue:0.169 alpha:1.000]