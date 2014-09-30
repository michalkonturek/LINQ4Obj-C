//
//  NSArray_LINQ_Quantifier_Tests.m
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

@interface NSArray_LINQ_Quantifier_Tests : XCTestCase

@property (nonatomic, strong) NSArray *input_numbers;
@property (nonatomic, strong) NSArray *input_words;

@end

@implementation NSArray_LINQ_Quantifier_Tests

- (void)setUp {
    self.input_numbers = @[@1, @2, @3, @4, @5];
    self.input_words = @[@"A", @"AB", @"ABC", @"ABCD", @"ABCDE"];
}

- (void)tearDown {
    self.input_numbers = nil;
    self.input_words = nil;
}

- (void)test_all {
    BOOL result = [self.input_words linq_all:^BOOL(id item) {
        return ([item length] > 0);
    }];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_all_returns_true_when_empty {
    BOOL result = [[NSArray array] linq_all:^BOOL(id item) {
        return YES;
    }];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_all_returns_true_when_no_condition {
    BOOL result = [self.input_numbers linq_all:nil];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_any {
    BOOL result = [self.input_words linq_any:^BOOL(id item) {
        return ([item length] > 3);
    }];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_any_returns_false_when_empty {
    BOOL result = [[NSArray array] linq_any:^BOOL(id item) {
        return YES;
    }];
    
    assertThatBool(result, equalToBool(NO));
}

- (void)test_any_returns_false_when_no_condition {
    BOOL result = [self.input_numbers linq_any:nil];
    assertThatBool(result, equalToBool(NO));
}


@end

