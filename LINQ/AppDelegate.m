//
//  AppDelegate.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 22/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "AppDelegate.h"

#import "LINQ.h"

@interface Person : NSObject

+ (instancetype)createWithName:(id)name withAge:(NSInteger)age;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger age;

@end

@implementation Person

+ (instancetype)createWithName:(id)name withAge:(NSInteger)age {
    id object = [[self alloc] init];
    [object setName:name];
    [object setAge:age];
    return object;
}

@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self example];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)example {
    
    id people = @[
                  [Person createWithName:@"Adam" withAge:23],
                  [Person createWithName:@"Alex" withAge:22],
                  [Person createWithName:@"Andrew" withAge:28],
                  [Person createWithName:@"Anthony" withAge:19],
                  [Person createWithName:@"Mark" withAge:30],
                  [Person createWithName:@"Matt" withAge:47],
                  [Person createWithName:@"Simon" withAge:33],
                  [Person createWithName:@"Steve" withAge:55],
                  ];
    
    id result = [[[people linq_where:^BOOL(id item) {
        return ([item age] > 21);
    }] linq_select:^id(id item) {
        return [item name];
    }] linq_groupBy:^id(id item) {
        return [item substringToIndex:1];
    }];
    
    for (id key in [result allKeys]) {
        id names = [[result valueForKey:key]
                    linq_aggregate:^id(id item, id aggregate) {
            return [NSString stringWithFormat:@"%@, %@",
                    aggregate, item];
        }];
        
        NSLog(@"%@ : %@", key, names);
    }
    
    /*
     Output:
     
     A : Adam, Alex, Andrew
     M : Mark, Matt
     S : Simon, Steve
     */
    
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {

}

@end
