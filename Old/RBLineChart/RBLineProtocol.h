//
//  RBLineProtocol.h
//  RBChart
//
//  Created by 天池邵 on 15/7/15.
//  Copyright (c) 2015年 rainbow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RBChartDefines.h"

@protocol RBLineNode <NSObject>

@required
- (void)drawNodeAtRect:(CGRect)rect;
- (instancetype)initWithHandler:(RBChartInitHandler)handler;

@end
