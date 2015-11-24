//
//  RBNode.m
//  RBChart
//
//  Created by Shao.Tc on 15/11/24.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import "RBNode.h"

@interface RBSolidNode : RBNode

@end

@implementation RBSolidNode

- (void)decoratorPath:(UIBezierPath *)path {
    [self.nodeColor setFill];
    [path fill];
    [super decoratorPath:path];
}

@end

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
        default:
            break;
    }
    
    return node;
}

- (void)decoratorPath:(UIBezierPath *)path {
    path.lineWidth = _borderWidth;
    [_nodeColor setStroke];
    [path stroke];
}

@end
