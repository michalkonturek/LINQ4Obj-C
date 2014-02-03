//
//  NSDictionary+LINQ_Quantifier.h
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 13/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ.h"

@interface NSDictionary (LINQ_Quantifier)

/**
 Determines whether all the elements in a sequence satisfy a condition.
 */
- (BOOL)linq_all:(BOOL (^)(id key, id value))block;

/**
 Determines whether any elements in a sequence satisfy a condition.
 */
- (BOOL)linq_any:(BOOL (^)(id key, id value))block;

@end
