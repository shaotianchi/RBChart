//
//  RBChartProtocols.h
//  RBChart
//
//  Created by Shao.Tc on 15/11/18.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RBAxis.h"
#import "RBChartIndicator.h"
#import "RBChartDefines.h"
#ifndef RBChartProtocols_h
#define RBChartProtocols_h

@protocol RBChartDecorator;

@protocol RBChartElement <NSObject>
@property (nonnull, copy, nonatomic) NSArray<NSNumber *> *values;
- (nullable instancetype)initWithHandler:(nonnull RBChartInitHandler)handler;

@required
- (void)drawWithDecorator:(nonnull id<RBChartDecorator>)decorator rect:(CGRect)rect;

@end

@protocol RBChartDecorator <NSObject>

@property (nonnull, copy, nonatomic) UIColor *boardBackgroundColor;
@property (nonnull, strong, nonatomic) NSArray<id<RBChartElement>> *elements;
@property (assign, nonatomic) CGFloat leading;
@property (assign, nonatomic) NSUInteger dataCount;
@property (assign, nonatomic) CGFloat maxValue;
@property (nullable, strong, nonatomic) RBAxis *xAxis;
@property (nullable, strong, nonatomic) RBAxis *yAxis;

- (nullable instancetype)initWithHandler:(nonnull RBChartInitHandler)handler;
- (CGFloat)spacingAtRect:(CGRect)rect;
- (nullable NSArray *)valuesAtIndex:(NSUInteger)index;

- (void)drawAtRect:(CGRect)rect;

@end

@protocol RBChart <NSObject>

@property (nonnull, strong, nonatomic)  id<RBChartDecorator> decorator;
@property (nullable, strong, nonatomic) RBChartIndicator *indicator;
@property (nullable, copy, nonatomic) ChartTouchHandler touchHandler;

@end

#endif /* RBChartProtocols_h */
