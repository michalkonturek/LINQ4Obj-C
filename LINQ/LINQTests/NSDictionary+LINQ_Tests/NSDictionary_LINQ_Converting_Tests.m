//
//  NSDictionary_LINQ_Converting_Tests.m
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

@interface NSDictionary_LINQ_Converting_Tests : XCTestCase

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
    id result = [self.input linq_toArray];
    
    assertThat(result, hasCountOf([self.input count]));
    assertThat(result, containsInAnyOrder(@"A", @"B", @"C", @"D", @"E", nil));
}

- (void)test_toArrayWhereKey {
    id result = [self.input linq_toArrayWhereKey:^BOOL(id item) {
        return ([item integerValue] > 3);
    }];
    
    assertThat(result, hasCountOf(2));
    assertThat(result, containsInAnyOrder(@"D", @"E", nil));
//    assertThat(result[0], equalTo(@"D"));
//    assertThat(result[1], equalTo(@"E"));
}

- (void)test_toArrayWhereValue {
    id result = [self.input linq_toArrayWhereValue:^BOOL(id item) {
        return ([item isEqualToString:@"A"] || [item isEqualToString:@"B"]);
    }];
    
    assertThat(result, hasCountOf(2));
    assertThat(result, containsInAnyOrder(@"A", @"B", nil));
}

- (void)test_toArrayWhereKeyValue {
    id result = [self.input linq_toArrayWhereKeyValue:^BOOL(id key, id value) {
        return (([key integerValue] == 1) && ([value isEqualToString:@"A"]));
    }];
    
    assertThat(result, hasCountOf(1));
    assertThat(result, containsInAnyOrder(@"A", nil));
}

@end
