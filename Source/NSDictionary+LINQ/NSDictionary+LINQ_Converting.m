//
//  NSDictionary+LINQ_Converting.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 12/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDictionary+LINQ_Converting.h"

@implementation NSDictionary (LINQ_Converting)

- (NSArray *)linq_toArray {
    return [self linq_toArrayWhereKey:nil];
}

- (NSArray *)linq_toArrayWhereKey:(LINQConditionBlock)block {
    if (!block) block = ^BOOL(id item) { return YES; };
    
    NSMutableArray *result = [NSMutableArray array];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (block(key)) [result addObject:obj];
    }];
    
    return result;
}

- (NSArray *)linq_toArrayWhereValue:(LINQConditionBlock)block {
    if (!block) block = ^BOOL(id item) { return YES; };
    
    NSMutableArray *result = [NSMutableArray array];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (block(obj)) [result addObject:obj];
    }];
    
    return result;
}

- (NSArray *)linq_toArrayWhereKeyValue:(LINQKeyValueConditionBlock)block {
    if (!block) block = ^BOOL(id key, id value) { return YES; };
    
    NSMutableArray *result = [NSMutableArray array];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (block(key, obj)) [result addObject:obj];
    }];
    
    return result;
}

@end
