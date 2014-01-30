//
//  NSArray_LINQ_Projection_Tests.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 22/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ_Base_Tests.h"

@interface NSArray_LINQ_Projection_Tests : SenTestCase

@end

@implementation NSArray_LINQ_Projection_Tests

- (void)test_select {
    
    NSArray *result = [[NSArray linq_from:1 to:5] linq_select:^id(id item) {
        return [NSNumber numberWithInteger:([item integerValue] + 10)];
    }];
    
    assertThat(result, contains(@11, @12, @13, @14, @15, nil));
}

- (void)test_select_returns_empty_when_no_condition {
    NSArray *result = [[NSArray linq_from:1 to:5] linq_select:nil];
    assertThat(result, isEmpty());
}

- (void)test_select_many {
    
    NSArray *result = [@[@"an apple a day", @"the quick brown fox"] linq_selectMany:^id(id item) {
        return [item componentsSeparatedByString:@" "];
    }];
    
    assertThat(result, contains(@"an",
                                @"apple",
                                @"a",
                                @"day",
                                @"the",
                                @"quick",
                                @"brown",
                                @"fox",
                                nil));
}

- (void)test_select_many_returns_empty_when_no_condition {
    NSArray *result = [[NSArray linq_from:1 to:5] linq_selectMany:nil];
    assertThat(result, isEmpty());
}

@end