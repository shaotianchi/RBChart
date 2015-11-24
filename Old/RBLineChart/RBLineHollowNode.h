//
//  RBLineHollowNode.h
//  RBChart
//
//  Created by 天池邵 on 15/7/15.
//  Copyright (c) 2015年 rainbow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RBChartProtocols.h"
#import "RBLineProtocol.h"

@interface RBLineHollowNode : NSObject <RBLineNode>
@property (assign, nonatomic) CGFloat nodeWidth;
@property (assign, nonatomic) CGFloat lineWidth;
@property (strong, nonatomic) UIColor *strokeColor;
@end
