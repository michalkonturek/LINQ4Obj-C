//
//  NSArray_LINQ_Projection_Tests.m
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

@interface NSArray_LINQ_Projection_Tests : XCTestCase

@end

@implementation NSArray_LINQ_Projection_Tests

- (void)test_select {
    
    NSArray *result = [[NSArray linq_from:1 to:5] linq_select:^id(id item) {
        return [NSNumber numberWithInteger:([item integerValue] + 10)];
    }];
    
    assertThat(result, contains(@11, @12, @13, @14, @15, nil));
}

- (void)test_select_returns_empty_when_no_condition {
    NSArray *result = [[NSArray linq_from:1 to:5] linq_select:nil];
    assertThat(result, isEmpty());
}

- (void)test_select_many {
    
    NSArray *result = [@[@"an apple a day", @"the quick brown fox"] linq_selectMany:^id(id item) {
        return [item componentsSeparatedByString:@" "];
    }];
    
    assertThat(result, contains(@"an",
                                @"apple",
                                @"a",
                                @"day",
                                @"the",
                                @"quick",
                                @"brown",
                                @"fox",
                                nil));
}

- (void)test_select_many_returns_empty_when_no_condition {
    NSArray *result = [[NSArray linq_from:1 to:5] linq_selectMany:nil];
    assertThat(result, isEmpty());
}

@end