//
//  NSArray+LINQ_Sets.m
//  LINQ
//
//  Created by Michal Konturek on 23/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

@implementation NSArray (LINQ_Sets)

- (instancetype)LINQ_distinct {
    if ([self count] == 0) return self;
    return [[[NSOrderedSet orderedSetWithArray:self] array] mutableCopy];
    
    /*
     NOTE: The following statement does not maintain order:
     return [self valueForKeyPath:@"@distinctUnionOfObjects.self"];
     */
}

- (instancetype)LINQ_except:(NSArray *)other {
    if ([self isEmpty]) return self;
    if (!other) return self;
    if ([other isEmpty]) return self;
    
    NSMutableArray *result = [NSMutableArray arrayWithArray:self];
    for (id item in other) {
        [result removeObject:item];
    }
    return result;
}

- (instancetype)LINQ_intersect:(NSArray *)other {
    if ([self isEmpty]) return self;
    if (!other) return self;
    if ([other isEmpty]) return self;
    
    NSMutableOrderedSet *result = [NSMutableOrderedSet orderedSetWithArray:self];
    [result intersectOrderedSet:[NSOrderedSet orderedSetWithArray:other]];
    return [[result array] mutableCopy];
}

- (NSArray *)LINQ_union:(NSArray *)other {
    if ([self isEmpty]) return other;
    if (!other) return self;
    if ([other isEmpty]) return self;
    
    NSMutableOrderedSet *result = [NSMutableOrderedSet orderedSetWithArray:self];
    [result unionOrderedSet:[NSOrderedSet orderedSetWithArray:other]];
    return [[result array] mutableCopy];
}

- (BOOL)isEmpty {
    return ([self count] == 0);
}

@end
