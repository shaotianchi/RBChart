//
//  RBCDrawer.h
//  RBChart
//
//  Created by Shao.Tc on 15/11/24.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RBChartData.h"
#import "RBChartCanvas.h"

typedef NSArray<NSNumber *> DataGroup;

@interface RBChartDrawer : NSObject
@property (strong, nonatomic) DataGroup *datas;

- (void)drawAtRect:(CGRect)rect canvas:(RBChartCanvas *)canvas;

@end
