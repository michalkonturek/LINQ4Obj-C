//
//  NSDictionary+LINQ_Generation.m
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


#import "NSDictionary+LINQ_Generation.h"

@implementation NSDictionary (LINQ_Generation)

+ (instancetype)linq_empty {
    return [self dictionary];
}

+ (instancetype)linq_from:(NSInteger)from to:(NSInteger)to {
    if (from == to) return [self linq_empty];
    
    NSInteger range = labs(from - to) + 1;
    NSInteger step = (from < to) ? 1 : -1;
    
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:range];
    for (NSInteger i = 0; i < range; i++) {
        [result setObject:@(from) forKey:@(i)];
        from += step;
    }
    return result;
}

+ (instancetype)linq_repeat:(id)element count:(NSInteger)count {
    if (count < 1) return [self linq_empty];
    if (!element) return [self linq_empty];
    
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:count];
    for (NSInteger i = 0; i < count; i++) {
        [result setObject:element forKey:@(i)];
    }
    return result;
}

//+ (instancetype)linq_with:(id (^)(id key, id value))block count:(NSInteger)count {
//    METHOD_NOT_IMPLEMENTED
//}

@end
