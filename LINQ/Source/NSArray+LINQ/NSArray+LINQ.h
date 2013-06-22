//
//  NSArray+LINQ.h
//  LINQ
//
//  Created by Michal Konturek on 22/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

typedef id (^LINQAccumulatorBlock)(id item, id aggregate);

typedef BOOL (^LINQConditionBlock)(id item);

typedef id (^LINQSelectorBlock)(id item);

#import "NSArray+LINQ_Aggregation.h"
#import "NSArray+LINQ_Filtering.h"
#import "NSArray+LINQ_Generation.h"
#import "NSArray+LINQ_Grouping.h"
#import "NSArray+LINQ_Partitioning.h"
#import "NSArray+LINQ_Projection.h"
