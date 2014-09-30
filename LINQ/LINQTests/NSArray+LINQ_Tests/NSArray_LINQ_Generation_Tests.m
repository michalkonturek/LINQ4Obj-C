//
//  NSArray_LINQ_Generation_Tests.m
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

@interface NSArray_LINQ_Generation_Tests : XCTestCase

@end

@implementation NSArray_LINQ_Generation_Tests

- (void)test_empty {
    NSArray *result = [NSArray linq_empty];
    assertThat(result, hasCountOf(0));
}

- (void)test_from_to_returns_empty_when_equal_parameters {
    NSArray *result = [NSArray linq_from:5 to:5];
    assertThat(result, isEmpty());
}

- (void)test_from_to_returns_when_ascending_both {
    NSInteger from = -1;
    NSInteger to = 5;
    [self aux_test_from_to_from:from to:to];
}

- (void)test_from_to_returns_when_ascending_negative {
    NSInteger from = -5;
    NSInteger to = -1;
    [self aux_test_from_to_from:from to:to];
}

- (void)test_from_to_returns_when_ascending_positive {
    NSInteger from = 1;
    NSInteger to = 5;
    [self aux_test_from_to_from:from to:to];
}

- (void)test_from_to_returns_when_descending_both {
    NSInteger from = 5;
    NSInteger to = -1;
    [self aux_test_from_to_from:from to:to];
}

- (void)test_from_to_returns_when_descending_negative {
    NSInteger from = -1;
    NSInteger to = -5;
    [self aux_test_from_to_from:from to:to];
}

- (void)test_from_to_returns_when_descending_positive {
    NSInteger from = 5;
    NSInteger to = 1;
    [self aux_test_from_to_from:from to:to];
}

- (void)aux_test_from_to_from:(NSInteger)from to:(NSInteger)to {
    NSArray *result = [NSArray linq_from:from to:to];
    
    NSInteger range = abs(from - to) + 1;
    assertThat(result, hasCountOf(range));
    assertThat([result objectAtIndex:0], equalToInteger(from));
    assertThat([result objectAtIndex:(range - 1)], equalToInteger(to));
}

- (void)test_repeat_count_returns_empty_when_no_element {
    NSArray *result = [NSArray linq_repeat:nil count:1];
    assertThat(result, hasCountOf(0));
}

- (void)test_repeat_count_returns_empty_when_count_below_one {
    NSArray *result = [NSArray linq_repeat:@"Element" count:0];
    assertThat(result, hasCountOf(0));
}

- (void)test_repeat {
    NSString *element = @"Element";
    NSArray *result = [NSArray linq_repeat:element count:5];
    assertThat(result, hasCountOf(5));
    assertThat(result[0], equalTo(element));
    assertThat(result[1], equalTo(element));
    assertThat(result[2], equalTo(element));
    assertThat(result[3], equalTo(element));
    assertThat(result[4], equalTo(element));
}

@end

