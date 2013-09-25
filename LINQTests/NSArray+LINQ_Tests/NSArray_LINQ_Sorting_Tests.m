//
//  NSArray_LINQ_Sorting_Tests.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 23/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ_Base_Tests.h"

@interface NSArray_LINQ_Sorting_Tests : SenTestCase

@property (nonatomic, strong) NSArray *input_numbers;
@property (nonatomic, strong) NSArray *input_words;

@end

@implementation NSArray_LINQ_Sorting_Tests

- (void)setUp {
    self.input_numbers = @[@1, @2, @3, @4, @5];
    self.input_words = @[@"A", @"AB", @"ABC", @"ABCD", @"ABCDE"];
}

- (void)tearDown {
    self.input_numbers = nil;
    self.input_words = nil;
}

- (void)test_orderByAscending_numbers {
    NSArray *result = [[self.input_numbers LINQ_reverse] LINQ_orderByAscending];
    assertThat(result, contains(@1, @2, @3, @4, @5, nil));
}

- (void)test_orderByDescending {
    NSArray *result = [self.input_numbers LINQ_orderByDescending];
    assertThat(result, contains(@5, @4, @3, @2, @1, nil));
}

- (void)test_reverese {
    NSArray *result = [self.input_numbers LINQ_reverse];
    assertThat(result, contains(@5, @4, @3, @2, @1, nil));
}

@end
