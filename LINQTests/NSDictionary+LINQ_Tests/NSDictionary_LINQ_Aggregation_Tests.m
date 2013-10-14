//
//  NSDictionary_LINQ_Aggregation_Tests.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 12/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ_Base_Tests.h"

@interface NSDictionary_LINQ_Aggregation_Tests : SenTestCase

@property (nonatomic, strong) NSDictionary *input_numbers;
@property (nonatomic, strong) NSDictionary *input_words;

@end

@implementation NSDictionary_LINQ_Aggregation_Tests

- (void)setUp {
    self.input_numbers = [NSDictionary LINQ_from:1 to:10];
    self.input_words = @{@1: @"A", @2: @"AB", @3: @"ABC", @4: @"ABCD", @5: @"ABCDE"};
}

- (void)tearDown {
    self.input_numbers = nil;
    self.input_words = nil;
}


@end
