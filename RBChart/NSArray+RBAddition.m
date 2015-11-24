//
//  NSArray+RBAddition.m
//  RBChart
//
//  Created by Shao.Tc on 15/11/18.
//  Copyright © 2015年 rainbow. All rights reserved.
//

#import "NSArray+RBAddition.h"
@implementation NSArray (RBAddition)

- (NSArray *)rb_flatMap:(id (^)(id))handler {
    NSMutableArray *result = [NSMutableArray array];
    for (id inner in self) {
        if ([inner isKindOfClass:[NSArray class]]) {
            for (id object in inner) {
                [result addObject:handler(object)];
            }
        } else {
            [result addObject:handler(inner)];
        }
    }
    return result;
}

- (NSArray *)rb_map:(id (^)(id))handler {
    NSMutableArray *result = [NSMutableArray array];
    for (id object in self) {
        [result addObject:handler(object)];
    }
    
    return result;
}

- (id)rb_max {
    NSArray *arr = [self sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    
    return arr.lastObject;
}

@end
