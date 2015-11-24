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
};

@interface RBNode : NSObject
@property (assign, nonatomic) CGFloat nodeWidth;
@property (assign, nonatomic) CGFloat borderWidth;
@property (copy, nonatomic) UIColor *nodeColor;

+ (instancetype)nodeWithType:(RBNodeType)type;
- (instancetype)initWithHandler:(RBChartInitHandler)handler;

- (void)decoratorPath:(UIBezierPath *)path;
@end
