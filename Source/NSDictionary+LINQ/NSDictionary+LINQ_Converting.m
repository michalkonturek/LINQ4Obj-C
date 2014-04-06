//
//  NSDictionary+LINQ_Converting.m
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


#import "NSDictionary+LINQ_Converting.h"

@implementation NSDictionary (LINQ_Converting)

- (NSArray *)linq_toArray {
    return [self linq_toArrayWhereKey:nil];
}

- (NSArray *)linq_toArrayWhereKey:(BOOL (^)(id item))block {
    if (!block) block = ^BOOL(id item) { return YES; };
    
    NSMutableArray *result = [NSMutableArray array];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (block(key)) [result addObject:obj];
    }];
    
    return result;
}

- (NSArray *)linq_toArrayWhereValue:(BOOL (^)(id item))block {
    if (!block) block = ^BOOL(id item) { return YES; };
    
    NSMutableArray *result = [NSMutableArray array];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (block(obj)) [result addObject:obj];
    }];
    
    return result;
}

- (NSArray *)linq_toArrayWhereKeyValue:(BOOL (^)(id key, id value))block {
    if (!block) block = ^BOOL(id key, id value) { return YES; };
    
    NSMutableArray *result = [NSMutableArray array];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (block(key, obj)) [result addObject:obj];
    }];
    
    return result;
}

@end
