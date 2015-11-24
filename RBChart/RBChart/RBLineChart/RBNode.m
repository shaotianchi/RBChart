//
//  RBNode.m
//  RBChart
//
//  Created by Shao.Tc on 15/11/24.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import "RBNode.h"

#pragma mark - 自定义 Node Interface
/**
 *  圆形实心 Node
 */
@interface RBSolidNode : RBNode

@end

/**
 *  三角形 Node
 */
@interface RBTriangleNode : RBNode

@end

#pragma mark - RBNode

@implementation RBNode

kInitWithHandler

+ (instancetype)nodeWithType:(RBNodeType)type {
    RBNode *node = nil;
    switch (type) {
        case RBDefaultBlueNode:
            node = [[RBNode alloc] initWithHandler:^(RBNode *node) {
                node.nodeColor = kRBDefaultBlue;
                node.nodeWidth = 5.;
                node.borderWidth = 2.;
            }];
            break;
        case RBDefaultYellowNode:
            node = [[RBNode alloc] initWithHandler:^(RBNode *node) {
                node.nodeColor = kRBDefaultYellow;
                node.nodeWidth = 5.;
                node.borderWidth = 2.;
            }];
            break;
        case RBDefaultSolidNode:
            node = [[RBSolidNode alloc] initWithHandler:^(RBNode *node) {
                node.nodeColor = kRBDefaultBlue;
                node.nodeWidth = 5.;
                node.borderWidth = 2.;
            }];
            break;
        case TriangleNode:
            node = [[RBTriangleNode alloc] initWithHandler:^(RBNode *node) {
                node.nodeColor = kRBDefaultBlue;
                node.nodeWidth = 5.;
                node.borderWidth = 2.;
            }];
            break;
    }
    
    return node;
}

- (void)decoratorPath:(UIBezierPath *)path {
    path.lineWidth = _borderWidth;
}

- (LinePoints)linePointsWithCenter:(CGPoint)center lastCenter:(CGPoint)lastCenter {
    CGFloat dx = center.x - lastCenter.x;
    CGFloat dy = center.y - lastCenter.y;
    CGFloat r = _nodeWidth / 2.;
    CGFloat distance = sqrt(pow(dx, 2) + pow(dy, 2));
    
    LinePoints linePoints;
    linePoints.beginPoint = CGPointMake(lastCenter.x + (dx * r) / distance,
                                        lastCenter.y + (dy * r) / distance);
    linePoints.endPoint   = CGPointMake(center.x - (dx * r) / distance,
                                        center.y - (dy * r) / distance);
    
    
    return linePoints;
}

@end

#pragma mark - 自定义 Node Implementation

@implementation RBSolidNode

- (void)decoratorPath:(UIBezierPath *)path {
    [self.nodeColor setFill];
    [path fill];
    [super decoratorPath:path];
}

- (LinePoints)linePointsWithCenter:(CGPoint)center lastCenter:(CGPoint)lastCenter {
    LinePoints linePoints;
    linePoints.beginPoint = lastCenter;
    linePoints.endPoint = center;
    return linePoints;
}

@end

@implementation RBTriangleNode

- (void)decoratorPath:(UIBezierPath *)path {
    CGPoint center = CGPointMake(CGRectGetMidX(path.bounds), CGRectGetMidY(path.bounds));
    [path removeAllPoints];
    CGPoint top = CGPointMake(center.x, center.y - (cos(30 * M_PI / 180.) * self.nodeWidth / 2));
    [path moveToPoint:top];
    [path addLineToPoint:CGPointMake(center.x - self.nodeWidth / 2., center.y + tan(30 * M_PI / 180.) * self.nodeWidth / 2)];
    [path addLineToPoint:CGPointMake(center.x + self.nodeWidth / 2., center.y + tan(30 * M_PI / 180.) * self.nodeWidth / 2)];
    [path addLineToPoint:top];
    [self.nodeColor setFill];
    [path fill];
    [super decoratorPath:path];
}

- (LinePoints)linePointsWithCenter:(CGPoint)center lastCenter:(CGPoint)lastCenter {
    LinePoints linePoints;
    linePoints.beginPoint = lastCenter;
    linePoints.endPoint = center;
    return linePoints;
}

@end
