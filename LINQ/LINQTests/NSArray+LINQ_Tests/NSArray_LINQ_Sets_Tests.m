//
//  NSArray_LINQ_Sets_Tests.m
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


#import "LINQ_Base_Tests.h"

@interface NSArray_LINQ_Sets_Tests : SenTestCase

@end

@implementation NSArray_LINQ_Sets_Tests


- (void)test_distinct {
    NSArray *result = [@[@1, @1, @2, @2, @3, @4, @5] linq_distinct];
    assertThat(result, contains(@1, @2, @3, @4, @5, nil));
}

- (void)test_distinctWithKey {
    NSString *key1 = @"key1";
    NSString *key2 = @"key2";
    NSArray *input = @[@{key1:@1}, @{key1:@1}, @{key1:@2}, @{key1:@2}, @{key1:@3}, @{key2:@1}, @{key2:@2}, @{key2:@2} ];
    NSArray *result = [input linq_distinctWithKey:key1];
    assertThat(result, contains(@{key1:@1}, @{key1:@2}, @{key1:@3}, nil));
}

- (void)test_distinct_returns_self_when_empty {
    NSArray *input = [NSArray array];
    NSArray *result = [input linq_distinct];
    assertThat(result, equalTo(input));
}

- (void)test_except {
    id result = [[NSArray linq_from:1 to:10] linq_except:[NSArray linq_from:6 to:10]];
    assertThat(result, contains(@1, @2, @3, @4, @5, nil));
}

- (void)test_except_returns_self_when_empty {
    NSArray *input = [NSArray array];
    NSArray *other = [NSArray linq_from:6 to:10];
    NSArray *result = [input linq_except:other];
    assertThat(result, sameInstance(input));
}

- (void)test_except_returns_self_when_other_empty {
    NSArray *input = [NSArray linq_from:1 to:5];
    NSArray *other = [NSArray array];
    NSArray *result = [input linq_except:other];
    assertThat(result, sameInstance(input));
}

- (void)test_except_returns_self_when_other_nil {
    NSArray *input = [NSArray linq_from:1 to:5];
    NSArray *other = nil;
    NSArray *result = [input linq_except:other];
    assertThat(result, sameInstance(input));
}

- (void)test_intersect {
    NSArray *input = [NSArray linq_from:1 to:8];
    NSArray *other = [NSArray linq_from:6 to:10];
    NSArray *result = [input linq_intersect:other];
    assertThat(result, contains(@6, @7, @8, nil));
}

- (void)test_intersect_returns_self_when_empty {
    NSArray *input = [NSArray array];
    NSArray *other = [NSArray linq_from:6 to:10];
    NSArray *result = [input linq_intersect:other];
    assertThat(result, sameInstance(input));
}

- (void)test_intersect_returns_self_when_other_empty {
    NSArray *input = [NSArray linq_from:6 to:10];
    NSArray *other =[NSArray array];
    NSArray *result = [input linq_intersect:other];
    assertThat(result, sameInstance(input));
}

- (void)test_intersect_returns_self_when_other_nil {
    NSArray *input = [NSArray linq_from:6 to:10];
    NSArray *other =nil;
    NSArray *result = [input linq_intersect:other];
    assertThat(result, sameInstance(input));
}

- (void)test_union {
    NSArray *input = [NSArray linq_from:1 to:8];
    NSArray *other = [NSArray linq_from:6 to:10];
    NSArray *result = [input linq_union:other];
    assertThat(result, contains(@1, @2, @3, @4, @5, @6, @7, @8, @9, @10, nil));
}

- (void)test_union_returns_other_when_empty {
    NSArray *input = [NSArray array];
    NSArray *other = [NSArray linq_from:6 to:10];
    NSArray *result = [input linq_union:other];
    assertThat(result, sameInstance(other));
}

- (void)test_union_returns_self_when_other_empty {
    NSArray *input = [NSArray linq_from:1 to:8];
    NSArray *other = [NSArray array];
    NSArray *result = [input linq_union:other];
    assertThat(result, sameInstance(input));
}

- (void)test_union_returns_self_when_other_nil {
    NSArray *input = [NSArray linq_from:1 to:8];
    NSArray *other = nil;
    NSArray *result = [input linq_union:other];
    assertThat(result, sameInstance(input));
}


@end
