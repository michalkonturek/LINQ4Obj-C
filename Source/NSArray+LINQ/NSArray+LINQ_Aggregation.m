//
//  NSArray+LINQ_Aggregation.m
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


#import "NSArray+LINQ_Aggregation.h"

@implementation NSArray (LINQ_Aggregation)

- (id)linq_aggregate:(id (^)(id item, id aggregate))block {
    if (!block) return self;
    
    id accumulator = nil;
    for (id item in self) {
        if (!accumulator) accumulator = item;
        else accumulator = block(item, accumulator);
    }
    return accumulator;
}

- (id)linq_avg {
    if ([self _isEmpty]) return [NSDecimalNumber zero];
    
    id sum = [self linq_sum];    
    NSDecimalNumber *result = [NSDecimalNumber decimalNumberWithDecimal:[sum decimalValue]];
    NSDecimalNumber *count = [NSDecimalNumber decimalNumberWithDecimal:
                              [[NSNumber numberWithInteger:[self count]] decimalValue]];
    
    return [result decimalNumberByDividingBy:count];
}

- (id)linq_avgForKey:(NSString *)key {
    return [self _aux_applyOperator:@"@avg" toKey:key];
}

- (NSUInteger)linq_count:(BOOL (^)(id item))block {
    return [[self linq_where:block] count];
}

- (id)linq_max {
    if ([self _isEmpty]) return [NSDecimalNumber zero];
    
    return [self linq_aggregate:^id(id item, id aggregate) {
        return ([item compare:aggregate] == NSOrderedDescending) ? item : aggregate;
    }];
}

- (id)linq_maxForKey:(NSString *)key {
    return [self _aux_applyOperator:@"@max" toKey:key];
}

- (id)linq_min {
    if ([self _isEmpty]) return [NSDecimalNumber zero];
    
    return [self linq_aggregate:^id(id item, id aggregate) {
        return ([item compare:aggregate] == NSOrderedAscending) ? item : aggregate;
    }];
}

- (id)linq_minForKey:(NSString *)key {
    return [self _aux_applyOperator:@"@min" toKey:key];
}

- (id)linq_sum {
    if ([self _isEmpty]) return [NSDecimalNumber zero];
    
    return [self linq_aggregate:^id(id item, id aggregate) {
        NSDecimalNumber *acc = [NSDecimalNumber
                                decimalNumberWithDecimal:[aggregate decimalValue]];
        return [acc decimalNumberByAdding:[NSDecimalNumber
                                    decimalNumberWithDecimal:[item decimalValue]]];
    }];
}

- (id)linq_sumForKey:(NSString *)key {
    return [self _aux_applyOperator:@"@sum" toKey:key];
}

- (id)_aux_applyOperator:(NSString *)op toKey:(NSString *)key {
    NSString *keyPath = [NSString stringWithFormat:@"%@.%@", op, key];
    return [self valueForKeyPath:keyPath];
}

- (BOOL)_isEmpty {
    return (self.count == 0);
}

@end
