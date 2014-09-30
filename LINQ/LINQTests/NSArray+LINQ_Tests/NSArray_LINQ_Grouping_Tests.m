//
//  NSArray_LINQ_Grouping_Tests.m
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

@interface NSArray_LINQ_Grouping_Tests : XCTestCase

@property (nonatomic, strong) NSArray *input_numbers;
@property (nonatomic, strong) NSArray *input_words;

@end

@implementation NSArray_LINQ_Grouping_Tests

- (void)setUp {
    self.input_numbers = [NSArray linq_from:1 to:10];
    self.input_words = @[@"Adam", @"Anthony",
                         @"Ben", @"Bob",
                         @"Michael", @"Max", @"Matt",
                         @"Simon"];
}

- (void)tearDown {
    self.input_numbers = nil;
    self.input_words = nil;
}

- (void)test_groupBy {
    NSDictionary *results = [self.input_words linq_groupBy:^id(id item) {
        return [item substringToIndex:1];
    }];
    
    assertThat(results, hasCountOf(4));
    assertThat([results allKeys], containsInAnyOrder(@"A", @"B", @"M", @"S", nil));
    assertThat([results objectForKey:@"A"], containsInAnyOrder(@"Adam", @"Anthony", nil));
    assertThat([results objectForKey:@"B"], containsInAnyOrder(@"Ben", @"Bob", nil));
    assertThat([results objectForKey:@"M"], containsInAnyOrder(@"Michael", @"Max", @"Matt", nil));
    assertThat([results objectForKey:@"S"], containsInAnyOrder(@"Simon", nil));
}

- (void)test_toLookup {
    NSArray *results = [self.input_words linq_toLookup:^id(id item) {
        return [item substringToIndex:1];
    }];
    
    assertThat(results, hasCountOf(8));
    assertThat([results linq_lookup:@"A"], hasCountOf(2));
    assertThat([results linq_lookup:@"B"], hasCountOf(2));
    assertThat([results linq_lookup:@"M"], hasCountOf(3));
    assertThat([results linq_lookup:@"S"], hasCountOf(1));
    
    assertThat([results linq_lookup:@"S"][0], hasEntry(@"S", @"Simon"));
}


@end
