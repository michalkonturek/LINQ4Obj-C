//
//  NSDictionary_LINQ_Quantifier_Tests.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 13/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ_Base_Tests.h"

@interface NSDictionary_LINQ_Quantifier_Tests : SenTestCase

@property (nonatomic, strong) NSDictionary *input;

@end

@implementation NSDictionary_LINQ_Quantifier_Tests

- (void)setUp {
    self.input = @{@1: @"A", @2: @"AB", @3: @"ABC", @4: @"ABCD", @5: @"ABCDE"};
}

- (void)tearDown {
    self.input = nil;
}

- (void)test_all_returns_true {
    BOOL result = [self.input LINQ_all:^BOOL(id key, id value) {
        return (([key integerValue] > 0) && ([value length] > 0));
    }];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_all_returns_false {
    BOOL result = [self.input LINQ_all:^BOOL(id key, id value) {
        return (([key integerValue] > 0) && ([value length] > 10));
    }];
    
    assertThatBool(result, equalToBool(NO));
}

- (void)test_all_returns_true_when_empty {
    BOOL result = [[NSDictionary LINQ_empty] linq_all:^BOOL(id key, id value) {
        return YES;
    }];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_all_returns_true_when_no_condition {
    BOOL result = [self.input LINQ_all:nil];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_any_returns_true {
    BOOL result = [self.input LINQ_any:^BOOL(id key, id value) {
        return (([key integerValue] > 0) && ([value length] > 4));
    }];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_any_returns_false {
    BOOL result = [self.input LINQ_any:^BOOL(id key, id value) {
        return (([key integerValue] > 0) && ([value length] > 10));
    }];
    
    assertThatBool(result, equalToBool(NO));
}

- (void)test_any_returns_false_when_empty {
    BOOL result = [[NSDictionary LINQ_empty] linq_any:^BOOL(id key, id value) {
        return YES;
    }];
    
    assertThatBool(result, equalToBool(NO));
}

- (void)test_any_returns_false_when_no_condition {
    BOOL result = [self.input LINQ_any:nil];
    assertThatBool(result, equalToBool(NO));
}

@end
