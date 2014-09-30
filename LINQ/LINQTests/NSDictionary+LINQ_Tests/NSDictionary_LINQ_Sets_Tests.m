//
//  NSDictionary_LINQ_Sets_Tests.m
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

@interface NSDictionary_LINQ_Sets_Tests : XCTestCase

@end

@implementation NSDictionary_LINQ_Sets_Tests

- (void)test_distinct {
    NSDictionary *result = [@{@1: @1, @2: @2, @3: @3, @4: @2} linq_distinct];

    assertThat(result, hasCountOf(3));
    assertThat([result allValues], containsInAnyOrder(@1, @2, @3, nil));
}

- (void)test_distinct_returns_self_when_empty {
    NSDictionary *input = [NSDictionary linq_empty];
    NSDictionary *result = [input linq_distinct];
    
    assertThat(result, hasCountOf(0));
    assertThat(result, sameInstance(input));
}

- (void)test_except {
    NSDictionary *input = [NSDictionary linq_from:1 to:10];
    NSDictionary *other = [NSDictionary linq_from:3 to:10];
    NSDictionary *result = [input linq_except:other];
    
    assertThat(result, hasCountOf(2));
    assertThat([result allValues], containsInAnyOrder(@1, @2, nil));
}

- (void)test_except_returns_self_when_empty {
    NSDictionary *input = [NSDictionary linq_empty];
    NSDictionary *other = [NSDictionary linq_from:3 to:10];
    NSDictionary *result = [input linq_except:other];
    
    assertThat(result, sameInstance(input));
}

- (void)test_except_returns_self_when_other_empty {
    NSDictionary *input = [NSDictionary linq_from:1 to:10];
    NSDictionary *other = [NSDictionary linq_empty];
    NSDictionary *result = [input linq_except:other];
    
    assertThat(result, sameInstance(input));
}

- (void)test_except_returns_self_when_other_nil {
    NSDictionary *input = [NSDictionary linq_from:1 to:10];
    NSDictionary *other = nil;
    NSDictionary *result = [input linq_except:other];
    
    assertThat(result, sameInstance(input));
}

- (void)test_intersect {
    NSDictionary *input = [NSDictionary linq_from:1 to:8];
    NSDictionary *other = [NSDictionary linq_from:6 to:10];
    NSDictionary *result = [input linq_intersect:other];
    
    assertThat(result, hasCountOf(3));
    assertThat([result allValues], containsInAnyOrder(@6, @7, @8, nil));
}

- (void)test_intersect_returns_self_when_empty {
    NSDictionary *input = [NSDictionary linq_empty];
    NSDictionary *other = [NSDictionary linq_from:3 to:10];
    NSDictionary *result = [input linq_intersect:other];
    
    assertThat(result, sameInstance(input));
}

- (void)test_intersect_returns_self_when_other_empty {
    NSDictionary *input = [NSDictionary linq_from:1 to:10];
    NSDictionary *other = [NSDictionary linq_empty];
    NSDictionary *result = [input linq_intersect:other];
    
    assertThat(result, sameInstance(input));
}

- (void)test_intersect_returns_self_when_other_nil {
    NSDictionary *input = [NSDictionary linq_from:1 to:10];
    NSDictionary *other = nil;
    NSDictionary *result = [input linq_intersect:other];
    
    assertThat(result, sameInstance(input));
}

- (void)test_merge {
    NSDictionary *input = [NSDictionary linq_from:1 to:8];
    NSDictionary *other = [NSDictionary linq_from:1 to:10];
    NSDictionary *result = [input linq_merge:other];
    
    assertThat(result, hasCountOf(10));
    assertThat([result allValues], containsInAnyOrder(@1, @2, @3, @4, @5, @6, @7, @8, @9, @10, nil));
}

- (void)test_merge_returns_other_when_empty {
    NSDictionary *input = [NSDictionary linq_empty];
    NSDictionary *other = [NSDictionary linq_from:1 to:5];
    NSDictionary *result = [input linq_merge:other];
    
    assertThat(result, sameInstance(other));
}

- (void)test_merge_returns_self_when_other_empty {
    NSDictionary *input = [NSDictionary linq_from:1 to:10];
    NSDictionary *other = [NSDictionary linq_empty];
    NSDictionary *result = [input linq_merge:other];
    
    assertThat(result, sameInstance(input));
}

- (void)test_merge_returns_self_when_other_nil {
    NSDictionary *input = [NSDictionary linq_from:1 to:10];
    NSDictionary *other = nil;
    NSDictionary *result = [input linq_merge:other];
    
    assertThat(result, sameInstance(input));
}

@end
