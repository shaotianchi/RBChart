//
//  RBChartBar.h
//  RBChart
//
//  Created by Shao.Tc on 15/11/24.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RBChartDefines.h"

@interface RBChartBar : NSObject
@property (copy, nonatomic) UIColor *barColor;

kInitWithHandler_H

- (void)decoratorPath:(UIBezierPath *)path;

@end
