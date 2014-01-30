//
//  Person.h
//  LINQ
//
//  Created by Michal Konturek on 30/01/2014.
//  Copyright (c) 2014 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

+ (instancetype)createWithName:(id)name withAge:(NSInteger)age;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger age;

@end
