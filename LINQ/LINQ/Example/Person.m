//
//  Person.m
//  LINQ
//
//  Created by Michal Konturek on 30/01/2014.
//  Copyright (c) 2014 Michal Konturek. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (instancetype)createWithName:(id)name withAge:(NSInteger)age {
    id object = [[self alloc] init];
    [object setName:name];
    [object setAge:age];
    return object;
}

@end
