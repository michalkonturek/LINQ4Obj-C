//
//  NSArray_LINQ_Partitioning_Tests.m
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

@interface NSArray_LINQ_Partitioning_Tests : XCTestCase

@end

@implementation NSArray_LINQ_Partitioning_Tests

- (void)test_skip {
    NSArray *result = [[NSArray linq_from:1 to:10] linq_skip:5];
    assertThat(result, contains(@6, @7, @8, @9, @10, nil));
}

- (void)test_take {
    NSArray *result = [[NSArray linq_from:1 to:10] linq_take:5];
    assertThat(result, contains(@1, @2, @3, @4, @5, nil));
}

@end
