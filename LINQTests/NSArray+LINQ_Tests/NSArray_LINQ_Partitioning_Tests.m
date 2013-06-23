//
//  NSArray_LINQ_Partitioning_Tests.m
//  LINQ
//
//  Created by Michal Konturek on 22/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ_Base_Tests.h"

@interface NSArray_LINQ_Partitioning_Tests : SenTestCase

@end

@implementation NSArray_LINQ_Partitioning_Tests

- (void)test_skip {
    NSArray *result = [[NSArray LINQ_from:1 to:10] LINQ_skip:5];
    assertThat(result, hasCountOf(5));
    assertThat(result, contains(@6, @7, @8, @9, @10, nil));
}

- (void)test_take {
    NSArray *result = [[NSArray LINQ_from:1 to:10] LINQ_take:5];
    assertThat(result, hasCountOf(5));
    assertThat(result, contains(@1, @2, @3, @4, @5, nil));
}

@end
