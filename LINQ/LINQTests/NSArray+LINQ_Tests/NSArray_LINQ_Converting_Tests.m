//
//  NSArray_LINQ_Converting_Tests.m
//  LINQ4Obj-C
//
//  Copyright (c) 2013 Michal Konturek
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//


#import "LINQ_Base_Tests.h"

@interface NSArray_LINQ_Converting_Tests : XCTestCase

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
    NSDictionary *result = [self.input_words linq_toDictionary];
    
    assertThat(result, hasCountOf(5));
    
    NSInteger idx = 0;
    for (id item in self.input_words) {
        assertThat([result objectForKey:[NSNumber numberWithInteger:idx]], equalTo(item));
        idx++;
    }
}

- (void)test_toDictionary_with_key_selector {
    NSDictionary *result = [self.input_numbers linq_toDictionaryWithKeyBlock:^id(id item) {
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
    
    NSDictionary *result = [self.input_numbers linq_toDictionaryWithKeyBlock:^id(id item) {
        return [NSNumber numberWithInteger:(10 + [item integerValue])];
    } valueBlock:^id(id item) {
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

