//
//  NSDictionary_LINQ_Quantifier_Tests.m
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

@interface NSDictionary_LINQ_Quantifier_Tests : SenTestCase

@property (nonatomic, strong) NSDictionary *input;

@end

@implementation NSDictionary_LINQ_Quantifier_Tests

- (void)setUp {
    self.input = @{@1: @"A", @2: @"AB", @3: @"ABC", @4: @"ABCD", @5: @"ABCDE"};
}

- (void)tearDown {
    self.input = nil;
}

- (void)test_all_returns_true {
    BOOL result = [self.input linq_all:^BOOL(id key, id value) {
        return (([key integerValue] > 0) && ([value length] > 0));
    }];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_all_returns_false {
    BOOL result = [self.input linq_all:^BOOL(id key, id value) {
        return (([key integerValue] > 0) && ([value length] > 10));
    }];
    
    assertThatBool(result, equalToBool(NO));
}

- (void)test_all_returns_true_when_empty {
    BOOL result = [[NSDictionary linq_empty] linq_all:^BOOL(id key, id value) {
        return YES;
    }];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_all_returns_true_when_no_condition {
    BOOL result = [self.input linq_all:nil];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_any_returns_true {
    BOOL result = [self.input linq_any:^BOOL(id key, id value) {
        return (([key integerValue] > 0) && ([value length] > 4));
    }];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_any_returns_false {
    BOOL result = [self.input linq_any:^BOOL(id key, id value) {
        return (([key integerValue] > 0) && ([value length] > 10));
    }];
    
    assertThatBool(result, equalToBool(NO));
}

- (void)test_any_returns_false_when_empty {
    BOOL result = [[NSDictionary linq_empty] linq_any:^BOOL(id key, id value) {
        return YES;
    }];
    
    assertThatBool(result, equalToBool(NO));
}

- (void)test_any_returns_false_when_no_condition {
    BOOL result = [self.input linq_any:nil];
    assertThatBool(result, equalToBool(NO));
}

@end
