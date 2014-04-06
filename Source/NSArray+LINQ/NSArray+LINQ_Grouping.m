//
//  NSArray+LINQ_Grouping.m
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
