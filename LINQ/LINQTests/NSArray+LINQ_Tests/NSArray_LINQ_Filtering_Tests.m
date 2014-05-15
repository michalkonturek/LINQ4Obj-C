//
//  NSArray_LINQ_Filtering_Tests.m
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

@interface NSArray_LINQ_Filtering_Tests : SenTestCase

@end

@implementation NSArray_LINQ_Filtering_Tests

- (void)test_ofType {
    NSArray *input = @[@"A", @1, @"B", @2];
    NSArray *result = [input linq_ofType:[NSString class]];
    
    assertThat(result, contains(@"A", @"B", nil));
}

- (void)test_where {
    
    NSArray *result = [[NSArray linq_from:1 to:10] linq_where:^BOOL(id item) {
        return (([item integerValue] % 2) == 0);
    }];
    
    assertThat(result, contains(@2, @4, @6, @8, @10, nil));
}

- (void)test_where_returns_when_no_condition {
    NSArray *result = [[NSArray linq_from:1 to:5] linq_where:nil];
    assertThatInteger([result count], equalToInteger(5));
}

- (void)test_linqFirstOrNil_returns_first {
     NSArray *input = @[@"A", @1, @"B", @2];
    id result = [input linq_firstOrNil:^BOOL(id item) {
        return [item isKindOfClass:[NSNumber class]];
    }];
     assertThatInteger([result integerValue], equalToInteger(1));
}

- (void)test_linqFirstOrNil_returns_nil {
    NSArray *input = @[@"A", @1, @"B", @2];
    id result = [input linq_firstOrNil:^BOOL(id item) {
        return [item isKindOfClass:[NSDate class]];
    }];
    assertThatBool((BOOL)result, equalToBool(NO));
}

@end