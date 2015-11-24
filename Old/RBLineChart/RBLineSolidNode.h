//
//  RBLineNode.h
//  RBChart
//
//  Created by 天池邵 on 15/7/15.
//  Copyright (c) 2015年 rainbow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RBLineProtocol.h"
#import "RBChartProtocols.h"
#import "RBChartDefines.h"

@interface RBLineSolidNode : NSObject <RBLineNode>
@property (assign, nonatomic) CGFloat nodeWidth;
@property (strong, nonatomic) UIColor *fillColor;
@property (strong, nonatomic) UIColor *strokeColor;
@end
