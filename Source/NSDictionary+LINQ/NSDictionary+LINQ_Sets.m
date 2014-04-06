//
//  NSDictionary+LINQ_Sets.m
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


#import "NSDictionary+LINQ_Sets.h"

@implementation NSDictionary (LINQ_Sets)

- (instancetype)linq_distinct {
    if ([self _isEmpty]) return self;
    
    NSArray *values = [[self allValues] linq_distinct];
    return [self _aux_dictionary_with_values:values];
}

- (instancetype)linq_except:(NSDictionary *)other {
    if ([self _isEmpty]) return self;
    if (!other) return self;
    if ([other _isEmpty]) return self;
    
    NSArray *values = [[self allValues] linq_except:[other allValues]];
    return [self _aux_dictionary_with_values:values];
}

- (instancetype)linq_intersect:(NSDictionary *)other {
    if ([self _isEmpty]) return self;
    if (!other) return self;
    if ([other _isEmpty]) return self;
    
    NSArray *values = [[self allValues] linq_intersect:[other allValues]];
    return [self _aux_dictionary_with_values:values];
}

- (NSDictionary *)_aux_dictionary_with_values:(NSArray *)values {
    
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    for (id value in values) {
        for (id key in [self allKeys]) {
            if ([value isEqual:[self objectForKey:key]]) {
                [result setObject:value forKey:key];
                break;
            }
        }
    }
    return result;
}

- (NSDictionary *)linq_merge:(NSDictionary *)other {
    if ([self _isEmpty]) return other;
    if (!other) return self;
    if ([other _isEmpty]) return self;
    
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithDictionary:self];
    [other enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (![result objectForKey:key]) [result setObject:obj forKey:key];
    }];
    
    return result;
}

- (BOOL)_isEmpty {
    return ([self count] == 0);
}

@end
