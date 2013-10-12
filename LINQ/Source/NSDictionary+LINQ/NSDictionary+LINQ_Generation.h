//
//  NSDictionary+LINQ_Generation.h
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 12/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ.h"

@interface NSDictionary (LINQ_Generation)

/**
 Returns empty dictionary.
 */
+ (instancetype)LINQ_empty;

/**
 Creates dictionary with integers from to.
 */
+ (instancetype)LINQ_from:(NSInteger)from to:(NSInteger)to;

/**
 Generates a collection that contains one repeated value.
 */
+ (instancetype)LINQ_repeat:(id)element count:(NSInteger)count;

/**
 TBC
 */
+ (instancetype)LINQ_with:(LINQKeyValueSelectorBlock)block count:(NSInteger)count;

@end
