//
//  NSArray+LINQ_Aggregation.h
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


#import "LINQ.h"

@interface NSArray (LINQ_Aggregation)

/**
 Performs a custom aggregation operation on the values of a collection.
 */
- (id)linq_aggregate:(id (^)(id item, id aggregate))block;

/**
 Calculates the average value of a collection of values.
 */
- (id)linq_avg;

/**
 Calculates the average value of the attribute specified
 by the key parameter for all objects in the collection.
 */
- (id)linq_avgForKey:(NSString *)key;

/**
 Counts the elements in a collection, optionally only
 those elements that satisfy a predicate function.
 */
- (NSUInteger)linq_count:(BOOL (^)(id item))block;

/**
 Determines the maximum value in a collection.
 */
- (id)linq_max;

/**
 Calculates the max value of the attribute specified
 by the key parameter for all objects in the collection.
 */
- (id)linq_maxForKey:(NSString *)key;

/**
 Determines the minimum value in a collection.
 */
- (id)linq_min;

/**
 Calculates the min value of the attribute specified
 by the key parameter for all objects in the collection.
 */
- (id)linq_minForKey:(NSString *)key;

/**
 Calculates the sum of the values in a collection
 */
- (id)linq_sum;

/**
 Calculates the sum of values of the attribute specified
 by the key parameter for all objects in the collection.
 */
- (id)linq_sumForKey:(NSString *)key;

@end
