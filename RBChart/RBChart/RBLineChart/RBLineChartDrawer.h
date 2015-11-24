//
//  RBLineChartDrawer.h
//  RBChart
//
//  Created by Shao.Tc on 15/11/24.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import "RBChartDrawer.h"
#import "RBLine.h"
#import "RBNode.h"
#import "RBChartDefines.h"

@interface RBLineChartDrawer : RBChartDrawer
@property (strong, nonatomic) RBLine *line;
@property (strong, nonatomic) RBNode *node;

- (instancetype)initWithHandler:(RBChartInitHandler)handler;

@end
