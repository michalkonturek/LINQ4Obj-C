//
//  NSDictionary+LINQ_Filtering.h
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 12/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ.h"

@interface NSDictionary (LINQ_Filtering)

/**
 Selects elements which keys can be cast to a specified type.
 */
- (instancetype)linq_ofTypeKey:(Class)klass;

/**
 Selects elements which values can be cast to a specified type.
 */
- (instancetype)linq_ofTypeValue:(Class)klass;

/**
 Selects values which satisify key-value condition.
 */
- (instancetype)linq_where:(BOOL (^)(id key, id value))block;

/**
 Selects values which keys satisify condition.
 */
- (instancetype)linq_whereKey:(BOOL (^)(id item))block;

/**
 Selects values which satisify condition.
 */
- (instancetype)linq_whereValue:(BOOL (^)(id item))block;

@end
