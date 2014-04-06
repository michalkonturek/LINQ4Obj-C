//
//  NSDictionary_LINQ_Aggregation_Tests.m
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

@interface NSDictionary_LINQ_Aggregation_Tests : SenTestCase

@property (nonatomic, strong) NSDictionary *input_numbers;
@property (nonatomic, strong) NSDictionary *input_words;

@end

@implementation NSDictionary_LINQ_Aggregation_Tests

- (void)setUp {
    self.input_numbers = [NSDictionary linq_from:1 to:10];
    self.input_words = @{@1: @"A", @2: @"AB", @3: @"ABC", @4: @"ABCD", @5: @"ABCDE"};
}

- (void)tearDown {
    self.input_numbers = nil;
    self.input_words = nil;
}

- (void)test_aggregate {
    NSNumber *result = [self.input_numbers linq_aggregate:^id(id item, id aggregate) {
        NSDecimalNumber *acc = [NSDecimalNumber decimalNumberWithDecimal:[aggregate decimalValue]];
        return [acc decimalNumberByMultiplyingBy:
                [NSDecimalNumber decimalNumberWithDecimal:[item decimalValue]]];
    }];
    
    assertThat(result, equalToInteger(3628800));
}

- (void)test_aggregate_returns_nil_when_empty {
    NSString *result = [[NSDictionary linq_empty] linq_aggregate:^id(id item, id aggregate) {
        return [NSString stringWithFormat:@"%@, %@", aggregate, item];
    }];
    
    assertThat(result, nilValue());
}

- (void)test_aggregate_returns_self_when_no_accumulator {
    NSDictionary *input = self.input_words;
    id result = [input linq_aggregate:nil];
    assertThat(result, equalTo(input));
}

- (void)test_avg {
    NSNumber *result = [self.input_numbers linq_avg];
    assertThat(result, equalToDouble(5.5));
}

- (void)test_avg_returns_zero_when_empty {
    NSNumber *result = [[NSDictionary linq_empty] linq_avg];
    assertThat(result, equalToDouble(0.0));
}

- (void)test_avgForKey {
    NSNumber *result = [self.input_words linq_avgForKey:@"length"];
    assertThat(result, equalToInteger(3));
}

- (void)test_count_returns_when_condition {
    NSInteger result = [self.input_numbers linq_count:^BOOL(id item) {
        return ([item compare:@8] != NSOrderedAscending);
    }];
    
    assertThatInteger(result, equalToInteger(3));
}

- (void)test_count_returns_when_no_condition {
    NSInteger result = [self.input_numbers linq_count:nil];
    assertThatInteger(result, equalToInteger([self.input_numbers count]));
}

- (void)test_max {
    NSNumber *result = [self.input_numbers linq_max];
    assertThat(result, equalToInteger(10));
}

- (void)test_max_returns_zero_when_empty {
    NSNumber *result = [[NSDictionary linq_empty] linq_max];
    assertThat(result, equalToInteger(0));
}

- (void)test_maxForKey {
    NSNumber *result = [self.input_words linq_maxForKey:@"length"];
    assertThat(result, equalToInteger(5));
}

- (void)test_min {
    NSNumber *result = [self.input_numbers linq_min];
    assertThat(result, equalToInteger(1));
}

- (void)test_min_returns_zero_when_empty {
    NSNumber *result = [[NSDictionary linq_empty] linq_min];
    assertThat(result, equalToInteger(0));
}

- (void)test_minForKey {
    NSNumber *result = [self.input_words linq_minForKey:@"length"];
    assertThat(result, equalToInteger(1));
}

- (void)test_sum_integers {
    NSNumber *result = [self.input_numbers linq_sum];
    assertThat(result, equalToInteger(55));
}

- (void)test_sum_double {
    NSNumber *result = [@[@1.25, @1.25, @3.3, @4.11] linq_sum];
    assertThat(result, equalToDouble(9.91));
}

- (void)test_sum_returns_zero_when_empty {
    NSNumber *result = [[NSDictionary linq_empty] linq_sum];
    assertThat(result, equalToInteger(0));
}

- (void)test_sumForKey {
    NSNumber *result = [self.input_words linq_sumForKey:@"length"];
    assertThat(result, equalToInteger(15));
}

- (void)test_sumForKey_returns_zero_when_empty {
    NSNumber *result = [[NSDictionary linq_empty] linq_sumForKey:@"someKey"];
    assertThat(result, equalToInteger(0));
}

@end
