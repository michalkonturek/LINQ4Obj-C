//
//  NSArray_LINQ_Quantifier_Tests.m
//  LINQ
//
//  Created by Michal Konturek on 23/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ_Base_Tests.h"

@interface NSArray_LINQ_Quantifier_Tests : SenTestCase

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
    BOOL result = [self.input_words LINQ_all:^BOOL(id item) {
        return ([item length] > 0);
    }];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_all_returns_true_when_empty {
    BOOL result = [[NSArray array] LINQ_all:^BOOL(id item) {
        return YES;
    }];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_all_returns_true_when_no_condition {
    BOOL result = [self.input_numbers LINQ_all:nil];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_any {
    BOOL result = [self.input_words LINQ_any:^BOOL(id item) {
        return ([item length] > 3);
    }];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_any_returns_false_when_empty {
    BOOL result = [[NSArray array] LINQ_any:^BOOL(id item) {
        return YES;
    }];
    
    assertThatBool(result, equalToBool(NO));
}

- (void)test_any_returns_false_when_no_condition {
    BOOL result = [self.input_numbers LINQ_any:nil];
    assertThatBool(result, equalToBool(NO));
}


@end

