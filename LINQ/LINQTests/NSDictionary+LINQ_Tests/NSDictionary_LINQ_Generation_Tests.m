//
//  NSDictionary_LINQ_Generation_Tests.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 12/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ_Base_Tests.h"

@interface NSDictionary_LINQ_Generation_Tests : SenTestCase

@end

@implementation NSDictionary_LINQ_Generation_Tests

- (void)test_empty {
    id result = [NSDictionary linq_empty];
    assertThat(result, hasCountOf(0));
}

- (void)test_from_to_returns_empty_when_equal_parameters {
    id result = [NSDictionary linq_from:5 to:5];
    assertThat(result, isEmpty());
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
    id result = [NSDictionary linq_from:from to:to];
    
    NSInteger range = abs(from - to) + 1;
    assertThat(result, hasCountOf(range));
    assertThat([result objectForKey:@(0)], equalToInteger(from));
    assertThat([result objectForKey:@(range - 1)], equalToInteger(to));
}

- (void)test_repeat_count_returns_empty_when_no_element {
    id result = [NSDictionary linq_repeat:nil count:1];
    assertThat(result, hasCountOf(0));
}

- (void)test_repeat_count_returns_empty_when_count_below_one {
    id result = [NSDictionary linq_repeat:@"Element" count:0];
    assertThat(result, hasCountOf(0));
}

- (void)test_repeat {
    NSString *element = @"Element";
    NSDictionary *result = [NSDictionary linq_repeat:element count:5];
    assertThat(result, hasCountOf(5));
    assertThat([result objectForKey:@(0)], equalTo(element));
    assertThat([result objectForKey:@(1)], equalTo(element));
    assertThat([result objectForKey:@(2)], equalTo(element));
    assertThat([result objectForKey:@(3)], equalTo(element));
    assertThat([result objectForKey:@(4)], equalTo(element));
}


@end
