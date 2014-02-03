//
//  NSDictionary+LINQ_Quantifier.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 13/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDictionary+LINQ_Quantifier.h"

@implementation NSDictionary (LINQ_Quantifier)

- (BOOL)linq_all:(BOOL (^)(id key, id value))block {
    if (!block) return YES;
    
    __block NSInteger failedCount = 0;
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (!block(key, obj)) failedCount++;
    }];
    
    return (failedCount == 0);
}

- (BOOL)linq_any:(BOOL (^)(id key, id value))block {
    if (!block) return NO;
    
    __block BOOL result = NO;
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (block(key, obj)) result = YES;
    }];
    
    return result;
}

@end
