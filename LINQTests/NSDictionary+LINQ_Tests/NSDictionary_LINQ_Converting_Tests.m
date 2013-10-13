//
//  NSDictionary_LINQ_Converting_Tests.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 12/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ_Base_Tests.h"

@interface NSDictionary_LINQ_Converting_Tests : SenTestCase

@property (nonatomic, strong) NSDictionary *input;

@end

@implementation NSDictionary_LINQ_Converting_Tests

- (void)setUp {
    self.input = @{@1: @"A", @2: @"B", @3: @"C", @4: @"D", @5: @"E",};
}

- (void)tearDown {
    self.input = nil;
}

- (void)test_toArray {
    id result = [self.input LINQ_toArray];
    
    assertThat(result, hasCountOf([self.input count]));
    assertThat(result, containsInAnyOrder(@"A", @"B", @"C", @"D", @"E", nil));
}

- (void)test_toArrayWhereKey {
    id result = [self.input LINQ_toArrayWhereKey:^BOOL(id item) {
        return ([item integerValue] > 3);
    }];
    
    assertThat(result, hasCountOf(2));
    assertThat(result[0], equalTo(@"D"));
    assertThat(result[1], equalTo(@"E"));
}

- (void)test_toArrayWhereValue {
    id result = [self.input LINQ_toArrayWhereValue:^BOOL(id item) {
        return ([item isEqualToString:@"A"] || [item isEqualToString:@"B"]);
    }];
    
    assertThat(result, hasCountOf(2));
    assertThat(result, containsInAnyOrder(@"A", @"B", nil));
}

- (void)test_toArrayWhereKeyValue {
    id result = [self.input LINQ_toArrayWhereKeyValue:^BOOL(id key, id value) {
        return (([key integerValue] == 1) && ([value isEqualToString:@"A"]));
    }];
    
    assertThat(result, hasCountOf(1));
    assertThat(result, containsInAnyOrder(@"A", nil));
}

@end
