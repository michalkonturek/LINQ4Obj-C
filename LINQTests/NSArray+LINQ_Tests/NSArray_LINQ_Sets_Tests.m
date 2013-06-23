//
//  NSArray_LINQ_Sets_Tests.m
//  LINQ
//
//  Created by Michal Konturek on 23/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ_Base_Tests.h"

@interface NSArray_LINQ_Sets_Tests : SenTestCase

@end

@implementation NSArray_LINQ_Sets_Tests


- (void)test_distinct {
    NSArray *result = [@[@1, @1, @2, @2, @3, @4, @5] LINQ_distinct];
    assertThat(result, contains(@1, @2, @3, @4, @5, nil));
}

- (void)test_distinct_returns_self_when_empty {
    NSArray *input = [NSArray array];
    NSArray *result = [input LINQ_distinct];
    assertThat(result, equalTo(input));
}

- (void)test_except {
    id result = [[NSArray LINQ_from:1 to:10] LINQ_except:[NSArray LINQ_from:6 to:10]];
    assertThat(result, contains(@1, @2, @3, @4, @5, nil));
}

- (void)test_except_returns_self_when_empty {
    NSArray *input = [NSArray array];
    NSArray *other = [NSArray LINQ_from:6 to:10];
    NSArray *result = [input LINQ_except:other];
    assertThat(result, sameInstance(input));
}

- (void)test_except_returns_self_when_other_empty {
    NSArray *input = [NSArray LINQ_from:1 to:5];
    NSArray *other = [NSArray array];
    NSArray *result = [input LINQ_except:other];
    assertThat(result, sameInstance(input));
}

- (void)test_except_returns_self_when_other_nil {
    NSArray *input = [NSArray LINQ_from:1 to:5];
    NSArray *other = nil;
    NSArray *result = [input LINQ_except:other];
    assertThat(result, sameInstance(input));
}

- (void)test_intersect {
    NSArray *input = [NSArray LINQ_from:1 to:8];
    NSArray *other = [NSArray LINQ_from:6 to:10];
    NSArray *result = [input LINQ_intersect:other];
    assertThat(result, contains(@6, @7, @8, nil));
}

- (void)test_intersect_returns_self_when_empty {
    NSArray *input = [NSArray array];
    NSArray *other = [NSArray LINQ_from:6 to:10];
    NSArray *result = [input LINQ_intersect:other];
    assertThat(result, sameInstance(input));
}

- (void)test_intersect_returns_self_when_other_empty {
    NSArray *input = [NSArray LINQ_from:6 to:10];
    NSArray *other =[NSArray array];
    NSArray *result = [input LINQ_intersect:other];
    assertThat(result, sameInstance(input));
}

- (void)test_intersect_returns_self_when_other_nil {
    NSArray *input = [NSArray LINQ_from:6 to:10];
    NSArray *other =nil;
    NSArray *result = [input LINQ_intersect:other];
    assertThat(result, sameInstance(input));
}

- (void)test_union {
    NSArray *input = [NSArray LINQ_from:1 to:8];
    NSArray *other = [NSArray LINQ_from:6 to:10];
    NSArray *result = [input LINQ_union:other];
    assertThat(result, contains(@1, @2, @3, @4, @5, @6, @7, @8, @9, @10, nil));
}

- (void)test_union_returns_other_when_empty {
    NSArray *input = [NSArray array];
    NSArray *other = [NSArray LINQ_from:6 to:10];
    NSArray *result = [input LINQ_union:other];
    assertThat(result, sameInstance(other));
}

- (void)test_union_returns_self_when_other_empty {
    NSArray *input = [NSArray LINQ_from:1 to:8];
    NSArray *other = [NSArray array];
    NSArray *result = [input LINQ_union:other];
    assertThat(result, sameInstance(input));
}

- (void)test_union_returns_self_when_other_nil {
    NSArray *input = [NSArray LINQ_from:1 to:8];
    NSArray *other = nil;
    NSArray *result = [input LINQ_union:other];
    assertThat(result, sameInstance(input));
}


@end
