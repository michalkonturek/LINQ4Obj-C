//
//  Example.m
//  LINQ
//
//  Created by Michal Konturek on 30/01/2014.
//  Copyright (c) 2014 Michal Konturek. All rights reserved.
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
