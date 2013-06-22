//
//  NSArray+LINQ_Aggregation.h
//  LINQ
//
//  Created by Michal Konturek on 22/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ.h"

@interface NSArray (LINQ_Aggregation)

/**
 Calculates the average value of a collection of values.
 */
- (id)LINQ_avg;

/**
 Calculates the average value of the attribute specified
 by the key parameter for all objects in the collection.
 */
- (id)LINQ_avgForKey:(NSString *)key;

/**
 Determines the maximum value in a collection.
 */
- (id)LINQ_max;

/**
 Calculates the max value of the attribute specified
 by the key parameter for all objects in the collection.
 */
- (id)LINQ_maxForKey:(NSString *)key;

/**
 Determines the minimum value in a collection.
 */
- (id)LINQ_min;

/**
 Calculates the min value of the attribute specified
 by the key parameter for all objects in the collection.
 */
- (id)LINQ_minForKey:(NSString *)key;

/**
 Calculates the sum of the values in a collection
 */
- (id)LINQ_sum;

/**
 Calculates the sum of values of the attribute specified
 by the key parameter for all objects in the collection.
 */
- (id)LINQ_sumForKey:(NSString *)key;

/**
 Performs a custom aggregation operation on the values of a collection.
 */
- (id)LINQ_aggregate:(LINQAccumulatorBlock)accumulatorBlock;

/**
 Counts the elements in a collection, optionally only
 those elements that satisfy a predicate function.
 */
- (NSUInteger)LINQ_count:(LINQConditionBlock)conditionBlock;

@end
