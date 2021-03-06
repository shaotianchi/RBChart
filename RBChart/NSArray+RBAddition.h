//
//  NSArray+RBAddition.h
//  RBChart
//
//  Created by Shao.Tc on 15/11/18.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSArray (RBAddition)

- (NSArray *)rb_flatMap:(id(^)(id))handler;
- (NSArray *)rb_map:(id(^)(id))handler;
- (NSNumber *)rb_sum;
- (id)rb_max;

@end
