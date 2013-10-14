//
//  NSDictionary_LINQ_Sets_Tests.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 13/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ_Base_Tests.h"

@interface NSDictionary_LINQ_Sets_Tests : SenTestCase

@end

@implementation NSDictionary_LINQ_Sets_Tests

- (void)test_distinct {
    NSDictionary *result = [@{@1: @1, @2: @2, @3: @3, @4: @2} LINQ_distinct];

    assertThat(result, hasCountOf(3));
    assertThat([result allValues], containsInAnyOrder(@1, @2, @3, nil));
}

- (void)test_distinct_returns_self_when_empty {
    NSDictionary *input = [NSDictionary LINQ_empty];
    NSDictionary *result = [input LINQ_distinct];
    
    assertThat(result, hasCountOf(0));
    assertThat(result, sameInstance(input));
}

- (void)test_except {
    NSDictionary *input = [NSDictionary LINQ_from:1 to:10];
    NSDictionary *other = [NSDictionary LINQ_from:3 to:10];
    NSDictionary *result = [input LINQ_except:other];
    
    assertThat(result, hasCountOf(2));
    assertThat([result allValues], containsInAnyOrder(@1, @2, nil));
}

- (void)test_except_returns_self_when_empty {
    NSDictionary *input = [NSDictionary LINQ_empty];
    NSDictionary *other = [NSDictionary LINQ_from:3 to:10];
    NSDictionary *result = [input LINQ_except:other];
    
    assertThat(result, sameInstance(input));
}

- (void)test_except_returns_self_when_other_empty {
    NSDictionary *input = [NSDictionary LINQ_from:1 to:10];
    NSDictionary *other = [NSDictionary LINQ_empty];
    NSDictionary *result = [input LINQ_except:other];
    
    assertThat(result, sameInstance(input));
}

- (void)test_except_returns_self_when_other_nil {
    NSDictionary *input = [NSDictionary LINQ_from:1 to:10];
    NSDictionary *other = nil;
    NSDictionary *result = [input LINQ_except:other];
    
    assertThat(result, sameInstance(input));
}

- (void)test_intersect {
    NSDictionary *input = [NSDictionary LINQ_from:1 to:8];
    NSDictionary *other = [NSDictionary LINQ_from:6 to:10];
    NSDictionary *result = [input LINQ_intersect:other];
    
    assertThat(result, hasCountOf(3));
    assertThat([result allValues], containsInAnyOrder(@6, @7, @8, nil));
}

- (void)test_intersect_returns_self_when_empty {
    NSDictionary *input = [NSDictionary LINQ_empty];
    NSDictionary *other = [NSDictionary LINQ_from:3 to:10];
    NSDictionary *result = [input LINQ_intersect:other];
    
    assertThat(result, sameInstance(input));
}

- (void)test_intersect_returns_self_when_other_empty {
    NSDictionary *input = [NSDictionary LINQ_from:1 to:10];
    NSDictionary *other = [NSDictionary LINQ_empty];
    NSDictionary *result = [input LINQ_intersect:other];
    
    assertThat(result, sameInstance(input));
}

- (void)test_intersect_returns_self_when_other_nil {
    NSDictionary *input = [NSDictionary LINQ_from:1 to:10];
    NSDictionary *other = nil;
    NSDictionary *result = [input LINQ_intersect:other];
    
    assertThat(result, sameInstance(input));
}

- (void)test_merge {
    NSDictionary *input = [NSDictionary LINQ_from:1 to:8];
    NSDictionary *other = [NSDictionary LINQ_from:1 to:10];
    NSDictionary *result = [input LINQ_merge:other];
    
    assertThat(result, hasCountOf(10));
    assertThat([result allValues], containsInAnyOrder(@1, @2, @3, @4, @5, @6, @7, @8, @9, @10, nil));
}

- (void)test_merge_returns_other_when_empty {
    NSDictionary *input = [NSDictionary LINQ_empty];
    NSDictionary *other = [NSDictionary LINQ_from:1 to:5];
    NSDictionary *result = [input LINQ_merge:other];
    
    assertThat(result, sameInstance(other));
}

- (void)test_merge_returns_self_when_other_empty {
    NSDictionary *input = [NSDictionary LINQ_from:1 to:10];
    NSDictionary *other = [NSDictionary LINQ_empty];
    NSDictionary *result = [input LINQ_merge:other];
    
    assertThat(result, sameInstance(input));
}

- (void)test_merge_returns_self_when_other_nil {
    NSDictionary *input = [NSDictionary LINQ_from:1 to:10];
    NSDictionary *other = nil;
    NSDictionary *result = [input LINQ_merge:other];
    
    assertThat(result, sameInstance(input));
}

@end
