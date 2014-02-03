//
//  NSArray+LINQ_Converting.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 23/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSArray+LINQ_Converting.h"

@implementation NSArray (LINQ_Converting)

- (NSDictionary *)linq_toDictionary {
    return [self linq_toDictionaryWithKeyBlock:nil valueBlock:nil];
}

- (NSDictionary *)linq_toDictionaryWithKeyBlock:(LINQSelectorBlock)block {
    return [self linq_toDictionaryWithKeyBlock:block valueBlock:nil];
}

- (NSDictionary *)linq_toDictionaryWithKeyBlock:(LINQSelectorBlock)keyBlock
                                     valueBlock:(LINQSelectorBlock)valueBlock {
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id key = (keyBlock) ? keyBlock(obj) : [NSNumber numberWithInteger:idx];
        id value = (valueBlock) ? valueBlock(obj) : obj;
        [result setObject:value forKey:key];
    }];
    
    return result;
}

@end
