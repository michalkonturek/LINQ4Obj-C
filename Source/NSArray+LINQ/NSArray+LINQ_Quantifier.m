//
//  NSArray+LINQ_Quantifier.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 23/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSArray+LINQ_Quantifier.h"

@implementation NSArray (LINQ_Quantifier)

- (BOOL)linq_all:(LINQConditionBlock)block {
    if (!block) return YES;
    for (id item in self) {
        if (!block(item)) return NO;
    }
    return YES;
}

- (BOOL)linq_any:(LINQConditionBlock)block {
    if (!block) return NO;
    for (id item in self) {
        if (block(item)) return YES;
    }
    return NO;
}

@end