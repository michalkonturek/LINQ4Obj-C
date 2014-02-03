//
//  NSArray+LINQ_Projection.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 22/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSArray+LINQ_Projection.h"

@implementation NSArray (LINQ_Projection)

- (instancetype)linq_select:(LINQSelectorBlock)block {
    if (!block) return [[self class] array];
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id value = block(obj) ?: [NSNull null];
        [result addObject:value];
    }];
    return result;
}

- (instancetype)linq_selectMany:(LINQSelectorBlock)block {
    if (!block) return [[self class] array];
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
    [self enumerateObjectsUsingBlock:^(id parent, NSUInteger idx, BOOL *stop) {
        [block(parent) enumerateObjectsUsingBlock:^(id child, NSUInteger idx, BOOL *stop) {
            id value = child ?: [NSNull null];
            [result addObject:value];
        }];
    }];
    
    return result;
}

@end