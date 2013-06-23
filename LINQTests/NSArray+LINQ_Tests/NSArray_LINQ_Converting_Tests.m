//
//  NSArray_LINQ_Converting_Tests.m
//  LINQ
//
//  Created by Michal Konturek on 23/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ_Base_Tests.h"

@interface NSArray_LINQ_Converting_Tests : SenTestCase

@property (nonatomic, strong) NSArray *input_numbers;
@property (nonatomic, strong) NSArray *input_words;

@end

@implementation NSArray_LINQ_Converting_Tests

- (void)setUp {
    self.input_numbers = @[@1, @2, @3, @4, @5];
    self.input_words = @[@"A", @"B", @"C", @"D", @"E"];
}

- (void)tearDown {
    self.input_numbers = nil;
    self.input_words = nil;
}

- (void)test_toDictionary {
    NSDictionary *result = [self.input_words LINQ_toDictionary];
    
    assertThat(result, hasCountOf(5));
    
    NSInteger idx = 0;
    for (id item in self.input_words) {
        assertThat([result objectForKey:[NSNumber numberWithInteger:idx]], equalTo(item));
        idx++;
    }
}

- (void)test_toDictionary_with_key_selector {
    NSDictionary *result = [self.input_numbers LINQ_toDictionaryWithKeySelector:^id(id item) {
        return [NSNumber numberWithInteger:(10 + [item integerValue])];
    }];
    
    assertThat(result, hasCountOf(5));
    
    NSInteger idx = 0;
    for (id item in self.input_numbers) {
        idx = 10 + [item integerValue];
        assertThat([result objectForKey:[NSNumber numberWithInteger:idx]], equalTo(item));
    }
}

- (void)test_toDictionary_with_key_and_value_selectors {
    
    NSDictionary *result = [self.input_numbers LINQ_toDictionaryWithKeySelector:^id(id item) {
        return [NSNumber numberWithInteger:(10 + [item integerValue])];
    } valueSelector:^id(id item) {
        return @"A";
    }];
    
    assertThat(result, hasCountOf(5));
    
    NSInteger idx = 0;
    for (id item in self.input_numbers) {
        idx = 10 + [item integerValue];
        assertThat([result objectForKey:[NSNumber numberWithInteger:idx]], equalTo(@"A"));
    }
}


@end

