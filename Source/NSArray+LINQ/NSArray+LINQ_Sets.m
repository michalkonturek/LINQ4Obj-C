//
//  NSArray+LINQ_Sets.m
//  LINQ4Obj-C
//
//  Copyright (c) 2013 Michal Konturek
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//


@implementation NSArray (LINQ_Sets)

- (instancetype)linq_distinct {
    if ([self count] == 0) return self;
    return [[[NSOrderedSet orderedSetWithArray:self] array] mutableCopy];
    
    /*
     NOTE: The following statement does not maintain order:
     return [self valueForKeyPath:@"@distinctUnionOfObjects.self"];
     */
}

- (NSArray *)linq_distinctByKey:(NSString *)keyPath
{
    NSMutableSet* keyValues = [[NSMutableSet alloc] init];
    NSMutableArray* distinctSet = [[NSMutableArray alloc] init];
    for (id item in self) {
        id keyForItem = [item valueForKeyPath:keyPath];
        if (!keyForItem) {
            keyForItem = [NSNull null];
        }
        if (![keyValues containsObject:keyForItem]) {
            [distinctSet addObject:item];
            [keyValues addObject:keyForItem];
        }
    }
    return distinctSet;
}

- (instancetype)linq_except:(NSArray *)other {
    if ([self _isEmpty]) return self;
    if (!other) return self;
    if ([other _isEmpty]) return self;
    
    NSMutableArray *result = [NSMutableArray arrayWithArray:self];
    for (id item in other) {
        [result removeObject:item];
    }
    return result;
}

- (instancetype)linq_intersect:(NSArray *)other {
    if ([self _isEmpty]) return self;
    if (!other) return self;
    if ([other _isEmpty]) return self;
    
    NSMutableOrderedSet *result = [NSMutableOrderedSet orderedSetWithArray:self];
    [result intersectOrderedSet:[NSOrderedSet orderedSetWithArray:other]];
    return [[result array] mutableCopy];
}

- (NSArray *)linq_union:(NSArray *)other {
    if ([self _isEmpty]) return other;
    if (!other) return self;
    if ([other _isEmpty]) return self;
    
    NSMutableOrderedSet *result = [NSMutableOrderedSet orderedSetWithArray:self];
    [result unionOrderedSet:[NSOrderedSet orderedSetWithArray:other]];
    return [[result array] mutableCopy];
}

- (BOOL)_isEmpty {
    return ([self count] == 0);
}

@end
