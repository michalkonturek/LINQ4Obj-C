//
//  NSDictionary_LINQ_Filtering_Tests.m
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

@interface NSDictionary_LINQ_Filtering_Tests : SenTestCase

@end

@implementation NSDictionary_LINQ_Filtering_Tests

- (void)test_ofTypeKey {
    id input = @{@1: @1, @"2": @2, @3: @3, @"4": @4};
    id result = [input linq_ofTypeKey:[NSString class]];
    
    assertThat(result, hasCountOf(2));
    assertThat([result allKeys], containsInAnyOrder(@"2", @"4", nil));
    assertThat([result allValues], containsInAnyOrder(@2, @4, nil));
}

- (void)test_ofTypeValue {
    id input = @{@1: @"A", @2: @"B", @3: @3, @4: @"C"};
    id result = [input linq_ofTypeValue:[NSString class]];

    assertThat(result, hasCountOf(3));
    assertThat([result allKeys], containsInAnyOrder(@1, @2, @4, nil));
    assertThat([result allValues], containsInAnyOrder(@"A", @"B", @"C", nil));
}

- (void)test_where {
    NSDictionary *input = [NSDictionary linq_from:1 to:10];
    id result = [input linq_where:^BOOL(id key, id value) {
        return (([key integerValue] > 5) && ([value integerValue] > 5));
    }];
 
    assertThat(result, hasCountOf(4));
    assertThat([result allKeys], containsInAnyOrder(@6, @7, @8, @9, nil));
    assertThat([result allValues], containsInAnyOrder(@7, @8, @9, @10, nil));
}

- (void)test_whereKey {
    id input = @{@1: @"A", @2: @"B", @3: @3, @4: @"C"};
    id result = [input linq_whereKey:^BOOL(id item) {
        return ([item integerValue] > 2);
    }];
    
    assertThat(result, hasCountOf(2));
    assertThat([result allKeys], containsInAnyOrder(@3, @4, nil));
    assertThat([result allValues], containsInAnyOrder(@3, @"C", nil));
}

- (void)test_whereValue {
    id input = @{@1: @"A", @2: @"B", @3: @3, @4: @"C"};
    id result = [input linq_whereValue:^BOOL(id item) {
        return ([item isKindOfClass:[NSNumber class]]);
    }];
    
    assertThat(result, hasCountOf(1));
    assertThat([result allKeys], contains(@3, nil));
    assertThat([result allValues], contains(@3, nil));
}

@end
