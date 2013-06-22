//
//  NSArray_LINQ_Generation_.m
//  LINQ
//
//  Created by Michal Konturek on 22/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ_Base_Tests.h"

@interface NSArray_LINQ_Generation_ : SenTestCase

@end

@implementation NSArray_LINQ_Generation_

- (void)test_empty {
    NSArray *result = [NSArray LINQ_empty];
    assertThat(result, hasCountOf(0));
}

- (void)test_from_to_returns_empty_when_equal_parameters {
    NSArray *result = [NSArray LINQ_from:5 to:5];
    assertThat(result, empty());
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
    NSArray *result = [NSArray LINQ_from:from to:to];
    
    NSInteger range = abs(from - to) + 1;
    assertThat(result, hasCountOf(range));
    assertThat([result objectAtIndex:0], equalToInteger(from));
    assertThat([result objectAtIndex:(range - 1)], equalToInteger(to));
}

- (void)test_repeat_count_returns_empty_when_no_element {
    NSArray *result = [NSArray LINQ_repeat:nil count:1];
    assertThat(result, hasCountOf(0));
}

- (void)test_repeat_count_returns_empty_when_count_below_one {
    NSArray *result = [NSArray LINQ_repeat:@"Element" count:0];
    assertThat(result, hasCountOf(0));
}

- (void)test_repeat {
    NSString *element = @"Element";
    NSArray *result = [NSArray LINQ_repeat:element count:5];
    assertThat(result, hasCountOf(5));
    assertThat(result[0], equalTo(element));
    assertThat(result[1], equalTo(element));
    assertThat(result[2], equalTo(element));
    assertThat(result[3], equalTo(element));
    assertThat(result[4], equalTo(element));
}

@end

