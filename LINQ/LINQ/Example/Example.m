//
//  Example.m
//  LINQ
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


#import "Example.h"

#import "LINQ.h"
#import "Person.h"

@implementation Example

+ (void)run {
    
    id people = @[
                  [Person createWithName:@"Adam" withAge:23],
                  [Person createWithName:@"Alex" withAge:22],
                  [Person createWithName:@"Andrew" withAge:28],
                  [Person createWithName:@"Anthony" withAge:19],
                  [Person createWithName:@"Mark" withAge:30],
                  [Person createWithName:@"Matt" withAge:47],
                  [Person createWithName:@"Simon" withAge:33],
                  [Person createWithName:@"Steve" withAge:55],
                  ];
    
    id result = [[[people linq_where:^BOOL(id item) {
        return ([item age] > 21);
    }] linq_select:^id(id item) {
        return [item name];
    }] linq_groupBy:^id(id item) {
        return [item substringToIndex:1];
    }];
    
    for (id key in [result allKeys]) {
        id names = [[result valueForKey:key]
                    linq_aggregate:^id(id item, id aggregate) {
                        return [NSString stringWithFormat:@"%@, %@",
                                aggregate, item];
                    }];
        
        NSLog(@"%@ : %@", key, names);
    }
    
    /*
     Output:
     
     A : Adam, Alex, Andrew
     M : Mark, Matt
     S : Simon, Steve
     */
}

@end
