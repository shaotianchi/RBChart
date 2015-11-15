//
//  RBBarChart.m
//  RBChart
//
//  Created by 天池邵 on 15/7/15.
//  Copyright (c) 2015年 rainbow. All rights reserved.
//

#import "RBBarChart.h"

@interface RBBarChart ()
@property (copy, nonatomic) NSArray *datas;
@property (copy, nonatomic) NSArray *titles;
//@property (strong, nonatomic) RBLineIndicator *indicatorView;
@property (assign, nonatomic) BOOL needDraw;
@property (copy, nonatomic) ChartTouchHandler touchHandler;
@property (assign, nonatomic) NSInteger dataCount;
@property (assign, nonatomic) CGFloat spacing;
@property (strong, nonatomic) UIView *selectedLine;

@end

@implementation RBBarChart

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    if (newSuperview) {
        self.backgroundColor = _chartDecorator.backgroundColor;
    }
}

#pragma mark - Lazy Init

//- (UIView *)indicatorView {
//    if (!_indicatorView) {
//        _indicatorView = [RBLineIndicator new];
//    }
//    
//    return _indicatorView;
//}

- (UIView *)selectedLine {
    if (!_selectedLine) {
        _selectedLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, .5, CGRectGetHeight(self.frame))];
        _selectedLine.backgroundColor = [UIColor whiteColor];
        [self addSubview:_selectedLine];
    }
    return _selectedLine;
}


#pragma mark - Setter

- (void)setMaxValue:(CGFloat)maxValue {
    if (!_autoMaxValue) {
        _maxValue = maxValue;
    }
}

- (void)setAutoMaxValue:(BOOL)autoMaxValue {
    _autoMaxValue = autoMaxValue;
    [self computeMaxValueAndMaxDataCount];
}

- (void)setDatas:(NSArray *)datas titles:(NSArray *)titles {
    _datas = datas;
    _titles = titles;
    [self computeMaxValueAndMaxDataCount];
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
    
    NSInteger index = (touchPoint.x - _chartDecorator.leading) / self.spacing;
    NSArray *touchedValues = [self showIndicatorAtIndex:index];
    
    !_touchHandler ?: _touchHandler(index, touchedValues);
}

- (NSArray *)showIndicatorAtIndex:(NSInteger)index {
    NSMutableArray *touchedValues = [NSMutableArray array];
    for (RBBarData *barData in _datas) {
        if (barData.values.count <= index) {
            continue;
        }
        
        [touchedValues addObject:barData.values[index]];
    }
    
//    [self.indicatorView setupTitles:_titles values:touchedValues];
    CGPoint center = CGPointMake(_chartDecorator.leading + self.spacing * index, 0);
//    [self.indicatorView showInView:self atPosition:center];
    NSInteger touchIdentifier = [[NSDate date] timeIntervalSince1970];
    self.selectedLine.hidden = NO;
    [UIView animateWithDuration:.35 animations:^{
        self.selectedLine.frame = CGRectMake(center.x, 0, .5, CGRectGetHeight(self.selectedLine.frame));
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            if (touchIdentifier == self.indicatorView.touchIdentifier) {
//                [self.indicatorView removeFromSuperview];
//                self.selectedLine.hidden = YES;
//                self.selectedLine.frame = CGRectMake(0, 0, .5, CGRectGetHeight(self.selectedLine.frame));
//            }
        });
    }];
    return touchedValues;
}

#pragma mark - Compute

- (void)computeMaxValueAndMaxDataCount {
    if (!_datas) {
        return;
    }
    
    _dataCount = 0;
    NSMutableArray *allValues = [NSMutableArray array];
    for (RBBarData *barData in _datas) {
        [allValues addObjectsFromArray:barData.values];
        if (barData.values.count > _dataCount) {
            _dataCount = barData.values.count;
        }
    }
    
    CGFloat maxValue = 0;
    for (int i = 0; i < (int)(allValues.count / 2. + 0.5); i ++ ) {
        CGFloat value1 = [allValues[i] doubleValue];
        CGFloat value2 = [allValues[allValues.count - i - 1] doubleValue];
        CGFloat tempMaxValue = value1 > value2 ? value1 : value2;
        if (tempMaxValue > maxValue) {
            maxValue = tempMaxValue;
        }
    }
    if (_autoMaxValue) {
        _maxValue = maxValue;
    }
}

- (CGFloat)spacing {
    return (CGRectGetWidth(self.frame) - _chartDecorator.leading * 2) / (_dataCount - 1);
}

#pragma mark - Draw

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    if (!_needDraw) {
        return;
    }
    
    for (RBBarData *barData in _datas) {
        NSInteger dataIndex = [_datas indexOfObject:barData];
        for (int i = 0; i < barData.values.count; i++) {
            NSNumber *value = barData.values[i];
            CGFloat scale = value.floatValue / _maxValue;
            CGPoint center = CGPointMake(_chartDecorator.leading + self.spacing * i, (1 - scale) * CGRectGetHeight(self.frame));
            CGFloat barWidth = self.spacing / 2 / _datas.count;
            CGFloat barHeight = CGRectGetHeight(rect) * scale;
            
            CGRect barFrame = CGRectMake(dataIndex * barWidth + center.x - self.spacing / 4, CGRectGetHeight(rect) - barHeight, barWidth, barHeight);
            [barData.barDecorator drawBarAtRect:barFrame];
        }
    }
}

- (void)draw {
    _needDraw = YES;
    [self  setNeedsDisplay];
}

@end
