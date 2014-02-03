//
//  NSDictionary+LINQ_Converting.h
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 12/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ.h"

@interface NSDictionary (LINQ_Converting)

/**
 Puts value elements into an NSArray.
 */
- (NSArray *)linq_toArray;

/**
 Puts value elements into a NSArray which satisfy key condtion.
 */
- (NSArray *)linq_toArrayWhereKey:(BOOL (^)(id item))block;

/**
 Puts value elements into a NSArray which satisfy value condtion.
 */
- (NSArray *)linq_toArrayWhereValue:(BOOL (^)(id item))block;

/**
 Puts value elements into a NSArray which satisfy both key and value condtion.
 */
- (NSArray *)linq_toArrayWhereKeyValue:(BOOL (^)(id key, id value))block;

@end
