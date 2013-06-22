//
//  NSArray_LINQ_Grouping_Tests.m
//  LINQ
//
//  Created by Michal Konturek on 22/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ_Base_Tests.h"

@interface NSArray_LINQ_Grouping_Tests : SenTestCase

@property (nonatomic, strong) NSArray *input_numbers;
@property (nonatomic, strong) NSArray *input_words;

@end

@implementation NSArray_LINQ_Grouping_Tests

- (void)setUp {
    self.input_numbers = [NSArray LINQ_from:1 to:10];
    self.input_words = @[@"Adam", @"Anthony",
                         @"Ben", @"Bob",
                         @"Michael", @"Max", @"Matt",
                         @"Simon"];
}

- (void)tearDown {
    self.input_numbers = nil;
    self.input_words = nil;
}

- (void)test_groupBy {
    NSDictionary *results = [self.input_words LINQ_groupBy:^id(id item) {
        return [item substringToIndex:1];
    }];
    
    assertThat(results, hasCountOf(4));
    assertThat([results allKeys], containsInAnyOrder(@"A", @"B", @"M", @"S", nil));
    assertThat([results objectForKey:@"A"], containsInAnyOrder(@"Adam", @"Anthony", nil));
    assertThat([results objectForKey:@"B"], containsInAnyOrder(@"Ben", @"Bob", nil));
    assertThat([results objectForKey:@"M"], containsInAnyOrder(@"Michael", @"Max", @"Matt", nil));
    assertThat([results objectForKey:@"S"], containsInAnyOrder(@"Simon", nil));
}

- (void)test_toLookup {
    NSArray *results = [self.input_words LINQ_toLookup:^id(id item) {
        return [item substringToIndex:1];
    }];
    
    assertThat(results, hasCountOf(8));
    assertThat([results LINQ_lookup:@"A"], hasCountOf(2));
    assertThat([results LINQ_lookup:@"B"], hasCountOf(2));
    assertThat([results LINQ_lookup:@"M"], hasCountOf(3));
    assertThat([results LINQ_lookup:@"S"], hasCountOf(1));
    
    assertThat([results LINQ_lookup:@"S"][0], hasEntry(@"S", @"Simon"));
}


@end
