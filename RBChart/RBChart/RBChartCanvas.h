//
//  RBChartCanvas.h
//  RBChart
//
//  Created by Shao.Tc on 15/11/24.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RBChartDefines.h"

@class RBChartDrawer;

typedef NS_ENUM(NSUInteger, RBChartCanvasType) {
    RBDefaultCanvas,
    RBGridCanvas,
};

@interface RBChartCanvas : NSObject
@property (assign, nonatomic) CGFloat leading;
@property (copy, nonatomic) UIColor *backgroundColor;
@property (assign, nonatomic) CGFloat maxValue;
@property (strong, nonatomic) NSArray<RBChartDrawer *> *drawers;

- (void)drawIfNeed:(CGRect)rect;

+ (instancetype)canvasWithType:(RBChartCanvasType)type;
- (void)setupProperty:(RBChartInitHandler)handler;

@end
