//
//  NSDictionary_LINQ_Partitioning_Tests.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 13/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ_Base_Tests.h"

@interface NSDictionary_LINQ_Partitioning_Tests : SenTestCase

@end

@implementation NSDictionary_LINQ_Partitioning_Tests

- (void)test_skip {
    NSDictionary *result = [[NSDictionary LINQ_from:1 to:10] LINQ_skip:5];
    assertThat(result, hasCountOf(5));
}

- (void)test_take {
    NSDictionary *result = [[NSDictionary LINQ_from:1 to:10] LINQ_take:5];
    assertThat(result, hasCountOf(5));
}

@end
