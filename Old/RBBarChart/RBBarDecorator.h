//
//  RBBarDecorator.h
//  RBChart
//
//  Created by 天池邵 on 15/7/15.
//  Copyright (c) 2015年 rainbow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RBBarDecorator : NSObject
@property (strong, nonatomic) UIColor *barColor;
- (void)drawBarAtRect:(CGRect)rect;
@end
