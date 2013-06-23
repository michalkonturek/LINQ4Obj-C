//
//  NSArray_LINQ_Filtering_Tests.m
//  LINQ
//
//  Created by Michal Konturek on 22/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ_Base_Tests.h"

@interface NSArray_LINQ_Filtering_Tests : SenTestCase

@end

@implementation NSArray_LINQ_Filtering_Tests

- (void)test_ofType {
    NSArray *input = @[@"A", @1, @"B", @2];
    
    NSArray *result = [input LINQ_ofType:[NSString class]];
    
    assertThat(result, hasCountOf(2));
    assertThat(result, contains(@"A", @"B", nil));
}

- (void)test_where {
    
    NSArray *result = [[NSArray LINQ_from:1 to:10] LINQ_where:^BOOL(id item) {
        return (([item integerValue] % 2) == 0);
    }];
    
    assertThat(result, hasCountOf(5));
    assertThat(result, contains(@2, @4, @6, @8, @10, nil));
}

- (void)test_where_returns_when_no_condition {
    NSArray *result = [[NSArray LINQ_from:1 to:5] LINQ_where:nil];
    assertThatInteger([result count], equalToInteger(5));
}


@end