//
//  NSArray+LINQ_Grouping.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 22/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSArray+LINQ_Grouping.h"

@implementation NSArray (LINQ_Grouping)

- (NSDictionary *)linq_groupBy:(id (^)(id item))block {
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    for (id item in self) {
        id key = block(item);
        NSMutableArray *group = [result objectForKey:key];
        if (!group) {
            group = [NSMutableArray array];
            [result setObject:group forKey:key];
        }
        [group addObject:item];
    }
    return result;
}

- (instancetype)linq_toLookup:(id (^)(id item))block {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
    for (id item in self) {
        id key = block(item);
        [result addObject:[NSDictionary dictionaryWithObject:item forKey:key]];
    }
    return result;
}

- (instancetype)linq_lookup:(id)key {
    return [self linq_where:^BOOL(id item) {
        return ([item objectForKey:key] != nil);
    }];
}



@end
