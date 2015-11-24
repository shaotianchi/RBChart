//
//  RBCData.h
//  RBChart
//
//  Created by Shao.Tc on 15/11/24.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NSArray<NSNumber *> DataGroup;

@interface RBChartData : NSObject
@property (copy, nonatomic) DataGroup *datas;
@end
