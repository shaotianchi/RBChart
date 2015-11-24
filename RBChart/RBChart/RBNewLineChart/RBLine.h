//
//  RBLine.h
//  RBChart
//
//  Created by Shao.Tc on 15/11/15.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import "RBChartProtocols.h"
#import "RBLineProtocol.h"
#import "RBBaseChartDecorator.h"

@interface RBLine : NSObject <RBChartElement>

@property (assign, nonatomic) CGFloat pointWidth;
@property (nonnull, copy, nonatomic) UIColor *lineColor;
@property (assign, nonatomic) CGFloat lineWidth;
@property (nonnull, strong, nonatomic) id<RBLineNode> lineNode;
@property (nonnull, copy, nonatomic) NSArray<NSNumber *> *values;

@end
