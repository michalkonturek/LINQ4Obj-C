//
//  NSDictionary+LINQ_Sorting.h
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 13/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ.h"

@interface NSDictionary (LINQ_Sorting)

/**
 Sorts elements in key ascending order.
 */
- (instancetype)LINQ_orderByAscending;

/**
 Sorts elements in key descending order.
 */
- (instancetype)LINQ_orderByDescending;

/**
 Reverses the order of the elements in a collection.
 */
- (instancetype)LINQ_reverse;


@end
