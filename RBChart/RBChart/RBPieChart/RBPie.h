//
//  RBPie.h
//  RBChart
//
//  Created by Shao.Tc on 15/11/25.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RBChartDefines.h"

@interface RBPie : NSObject
kInitWithHandler_H
@property (copy, nonatomic) NSArray<UIColor *> *colors;
- (void)decoratorPath:(UIBezierPath *)path;
@end
