//
//  RBBarData.h
//  RBChart
//
//  Created by 天池邵 on 15/7/15.
//  Copyright (c) 2015年 rainbow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RBBarDecorator.h"

@interface RBBarData : NSObject
@property (copy, nonatomic) NSArray *values;
@property (strong, nonatomic) RBBarDecorator *barDecorator;
@end
