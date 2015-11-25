//
//  RBLineChartDrawer.h
//  RBChart
//
//  Created by Shao.Tc on 15/11/24.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import "RBChartDrawer.h"
#import "RBChartLine.h"
#import "RBChartNode.h"
#import "RBChartDefines.h"

@interface RBLineChartDrawer : RBChartDrawer
@property (strong, nonatomic) RBChartLine *line;
@property (strong, nonatomic) RBChartNode *node;

kInitWithHandler_H

@end
