//
//  NSDictionary_LINQ_Filtering_Tests.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 12/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ_Base_Tests.h"

@interface NSDictionary_LINQ_Filtering_Tests : SenTestCase

@end

@implementation NSDictionary_LINQ_Filtering_Tests

- (void)test_ofTypeKey {
    id input = @{@1: @1, @"2": @2, @3: @3, @"4": @4};
    id result = [input LINQ_ofTypeKey:[NSString class]];
    
    assertThat(result, hasCountOf(2));
    assertThat([result allKeys], containsInAnyOrder(@"2", @"4", nil));
    assertThat([result allValues], containsInAnyOrder(@2, @4, nil));
}

- (void)test_ofTypeValue {
    id input = @{@1: @"A", @2: @"B", @3: @3, @4: @"C"};
    id result = [input LINQ_ofTypeValue:[NSString class]];

    assertThat(result, hasCountOf(3));
    assertThat([result allKeys], containsInAnyOrder(@1, @2, @4, nil));
    assertThat([result allValues], containsInAnyOrder(@"A", @"B", @"C", nil));
}

- (void)test_where {
    NSDictionary *input = [NSDictionary LINQ_from:1 to:10];
    id result = [input LINQ_where:^BOOL(id key, id value) {
        return (([key integerValue] > 5) && ([value integerValue] > 5));
    }];
 
    assertThat(result, hasCountOf(4));
    assertThat([result allKeys], containsInAnyOrder(@6, @7, @8, @9, nil));
    assertThat([result allValues], containsInAnyOrder(@7, @8, @9, @10, nil));
}

- (void)test_whereKey {
    id input = @{@1: @"A", @2: @"B", @3: @3, @4: @"C"};
    id result = [input LINQ_whereKey:^BOOL(id item) {
        return ([item integerValue] > 2);
    }];
    
    assertThat(result, hasCountOf(2));
    assertThat([result allKeys], containsInAnyOrder(@3, @4, nil));
    assertThat([result allValues], containsInAnyOrder(@3, @"C", nil));
}

- (void)test_whereValue {
    id input = @{@1: @"A", @2: @"B", @3: @3, @4: @"C"};
    id result = [input LINQ_whereValue:^BOOL(id item) {
        return ([item isKindOfClass:[NSNumber class]]);
    }];
    
    assertThat(result, hasCountOf(1));
    assertThat([result allKeys], contains(@3, nil));
    assertThat([result allValues], contains(@3, nil));
}

@end
