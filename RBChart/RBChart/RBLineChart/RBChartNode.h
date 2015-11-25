//
//  RBNode.h
//  RBChart
//
//  Created by Shao.Tc on 15/11/24.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RBChartDefines.h"

typedef NS_ENUM(NSUInteger, RBNodeType) {
    RBDefaultBlueNode,
    RBDefaultYellowNode,
    RBDefaultSolidNode,
    TriangleNode
};

struct LinePoints {
    CGPoint beginPoint;
    CGPoint endPoint;
};
typedef struct LinePoints LinePoints;

/**
 *  RBNode - 默认为圆形
 */
@interface RBChartNode : NSObject
@property (assign, nonatomic) CGFloat nodeWidth;
@property (assign, nonatomic) CGFloat borderWidth;
@property (copy, nonatomic) UIColor *nodeColor;

+ (instancetype)nodeWithType:(RBNodeType)type;
kInitWithHandler_H

/**
 *  对 path 进行装饰
 *
 *  @param path
 */
- (void)decoratorPath:(UIBezierPath *)path;

/**
 *  为 RBLine 提供起始坐标
 *  不同的 Node 有不同的计算方式
 *
 *  @param center
 *  @param lastCenter
 *
 */
- (LinePoints)linePointsWithCenter:(CGPoint)center lastCenter:(CGPoint)lastCenter;
@end
