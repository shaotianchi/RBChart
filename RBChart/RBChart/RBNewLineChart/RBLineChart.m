//
//  RBLineChart.m
//  RBChart
//
//  Created by Shao.Tc on 15/11/18.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import "RBLineChart.h"
#import "RBLine.h"
#import "NSArray+RBAddition.h"
#import "RBLineIndicator.h"

@interface RBLineChart ()
@property (assign, nonatomic) BOOL needDraw;
@property (strong, nonatomic) UIView *selectedLine;
@end

@implementation RBLineChart
@synthesize indicator = _indicator, touchHandler = _touchHandler, decorator = _decorator;

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    if (!_needDraw) {
        return;
    }
    
    [self.decorator drawAtRect:rect];
}

- (void)draw {
    _needDraw = YES;
    self.backgroundColor = self.decorator.boardBackgroundColor;
    [self setNeedsDisplay];
}

#pragma mark - Lazy Init

- (UIView *)indicatorView {
    if (!_indicator) {
        _indicator = [RBLineIndicator new];
    }
    
    return _indicator;
}

- (UIView *)selectedLine {
    if (!_selectedLine) {
        _selectedLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, .5, CGRectGetHeight(self.frame))];
        _selectedLine.backgroundColor = [UIColor whiteColor];
        [self addSubview:_selectedLine];
    }
    return _selectedLine;
}

#pragma mark - Touch

- (void)handlerTouch:(ChartTouchHandler)touchHandler {
    _touchHandler = touchHandler;
    self.userInteractionEnabled = YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[touches allObjects] firstObject];
    [self chartBeTouched:touch];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[touches allObjects] firstObject];
    [self chartBeTouched:touch];
}

- (void)chartBeTouched:(UITouch *)touch {
    CGPoint touchPoint = [touch locationInView:self];
    CGFloat spacing = [self.decorator spacingAtRect:self.frame];
    NSInteger index = (touchPoint.x - self.decorator.leading) / spacing;
    NSArray *touchedValues = [self showIndicatorAtIndex:index];
    
    !_touchHandler ?: _touchHandler(index, touchedValues);
}

- (NSArray *)showIndicatorAtIndex:(NSInteger)index {
    NSArray *touchedValues = [_decorator valuesAtIndex:index];
    [(RBLineIndicator *)self.indicator setupTitles:[[_decorator xAxis] values] values:touchedValues];
    CGPoint center = CGPointMake(_decorator.leading + [_decorator spacingAtRect:self.frame] * index, 0);
    [(RBLineIndicator *)self.indicator showInView:self atPosition:center];
    NSInteger touchIdentifier = [[NSDate date] timeIntervalSince1970];
    self.selectedLine.hidden = NO;
    [UIView animateWithDuration:.35 animations:^{
        self.selectedLine.frame = CGRectMake(center.x, 0, .5, CGRectGetHeight(self.selectedLine.frame));
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (touchIdentifier == [(RBLineIndicator *)self.indicator touchIdentifier]) {
                [self.indicatorView removeFromSuperview];
                self.selectedLine.hidden = YES;
                self.selectedLine.frame = CGRectMake(0, 0, .5, CGRectGetHeight(self.selectedLine.frame));
            }
        });
    }];
    return touchedValues;
}

@end
