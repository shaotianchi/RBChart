//
//  RBLineProtocol.h
//  RBChart
//
//  Created by 天池邵 on 15/7/15.
//  Copyright (c) 2015年 rainbow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RBChartProtocols.h"
#import "RBChartDefines.h"

@protocol RBLineNode <RBChartElement>

@required
- (instancetype)initWithHandler:(RBChartInitHandler)handler;

@end
