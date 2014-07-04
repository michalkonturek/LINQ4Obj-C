# LINQ for Objective-C

[![Twitter](https://img.shields.io/badge/contact-@MichalKonturek-blue.svg?style=flat)](http://twitter.com/michalkonturek)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/michalkonturek/LINQ4Obj-C/blob/master/LICENSE)
[![CocoaPods](https://img.shields.io/cocoapods/v/LINQ4Obj-C.svg?style=flat)](https://github.com/michalkonturek/LINQ4Obj-C)
[![Build Status](http://img.shields.io/travis/michalkonturek/LINQ4Obj-C.svg?style=flat)](https://travis-ci.org/michalkonturek/LINQ4Obj-C)

<!--[![License MIT](https://go-shields.herokuapp.com/license-MIT-blue.png)](https://github.com/michalkonturek/LINQ4Obj-C/blob/master/LICENSE)
[![Build Platform](https://cocoapod-badges.herokuapp.com/p/LINQ4Obj-C/badge.png)](https://github.com/michalkonturek/LINQ4Obj-C)
[![Build Version](https://cocoapod-badges.herokuapp.com/v/LINQ4Obj-C/badge.png)](https://github.com/michalkonturek/LINQ4Obj-C)
[![Build Status](https://travis-ci.org/michalkonturek/LINQ4Obj-C.png?branch=master)](https://travis-ci.org/michalkonturek/LINQ4Obj-C)-->

Provides fluent interface of LINQ-style query to Objective-C.

## Intro

This project ports LINQ standard query operators to Objective-C. This is achieved by collection of categories for `NSArray` and `NSDictionary` classes.

This library is available through [CocoaPods][PODS].

## License

Source code of this project is available under the standard MIT license. Please see [the license file][LICENSE].

[PODS]:http://cocoapods.org/
[LICENSE]:https://github.com/michalkonturek/LINQ4Obj-C/blob/master/LICENSE


## Example 

```objc
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
```

# API

* [Aggregation Operations](#aggregation-operations)
* [Converting Operations](#converting-operations)
* [Filtering Operations](#filtering-operations)
* [Generation Operations](#generation-operations)
* [Grouping Operations](#grouping-operations)
* [Partitioning Operations](#partitioning-operations)
* [Projection Operations](#projection-operations)
* [Quantifier Operations](#quantifier-operations)
* [Set Operations](#set-operations)
* [Sorting Operations](#sorting-operations)

## Aggregation Operations

#### Aggregate

 Performs a custom aggregation operation on the values of a collection.

```objc
- (id)linq_aggregate:(id (^)(id item, id aggregate))block;
```

The following example creates a coma-separated string from an array of strings.

```objc
NSArray *input = @[@"M", @"A", @"R", @"K"];
NSString *result = [input linq_aggregate:^id(id item, id aggregate) {
    return [NSString stringWithFormat:@"%@, %@", aggregate, item];
}];	
// Result is: @"M, A, R, K"
```

#### Average

Calculates the average value of a collection of values.

```objc
- (id)linq_avg;
```

Calculates the average value of the attribute specified
by the key parameter for all objects in the collection.

```objc
- (id)linq_avgForKey:(NSString *)key; 
```

Example: Return the average length of strings in the collection.

```objc
NSArray *words = @[@"A", @"AB", @"ABC", @"ABCD", @"ABCDE"];
NSNumber *avg_word_length = [words linq_avgForKey:@"length"];
// Result is 3.
```


#### Count

Counts the elements in a collection, optionally only 
those elements that satisfy a predicate function.

```objc
- (NSUInteger)linq_count:(BOOL (^)(id item))block;
```

Example: Return the number of elements 
in the collection that are not smaller than 8.

```objc
NSArray *numbers = [NSArray linq_from:1 to:10];
NSInteger *count = [numbers linq_count:^BOOL(id item) {
        return ([item compare:@8] != NSOrderedAscending);
    }];
// Count is 3.
```


#### Max

Determines the maximum value in a collection.

```objc
- (id)linq_max;
```

Calculates the max value of the attribute specified
by the key parameter for all objects in a collection.

```objc
- (id)linq_maxForKey:(NSString *)key;
```


#### Min

Determines the minimum value in a collection.

```objc
- (id)linq_min;
```

Calculates the min value of the attribute specified
by the key parameter for all objects in the collection.

```objc
- (id)linq_minForKey:(NSString *)key;
```


#### Sum

 Calculates the sum of the values in a collection.

```objc
- (id)linq_sum;
```

 Calculates the sum of values of the attribute specified
 by the key parameter for all objects in a collection.

```objc
- (id)linq_sumForKey:(NSString *)key;
```


<!--## Concatenation Operations-->


## Converting Operations

#### ToArray

Puts value elements into an NSArray.

```objc
- (NSArray *)linq_toArray;
```

Puts value elements into a NSArray which satisfy key condtion.
 
```objc
- (NSArray *)linq_toArrayWhereKey:(BOOL (^)(id item))block;
```

Puts value elements into a NSArray which satisfy value condtion.

```objc
- (NSArray *)linq_toArrayWhereValue:(BOOL (^)(id item))block;
```

Puts value elements into a NSArray which satisfy both key and value condtion.

```objc
- (NSArray *)linq_toArrayWhereKeyValue:(BOOL (^)(id key, id value))block;
```

#### ToDictionary

 Puts elements into an index-key-based NSDictionary.

```objc
- (NSDictionary *)linq_toDictionary;
```

Puts elements into a NSDictionary based on a key selector function.

```objc
- (NSDictionary *)linq_toDictionaryWithKeyBlock:(id (^)(id item))block;
```

Puts elements into a NSDictionary based on a key and value selector functions.

```objc
- (NSDictionary *)linq_toDictionaryWithKeyBlock:(id (^)(id item))keyBlock
                                     valueBlock:(id (^)(id item))valueBlock;
```


## Filtering Operations

#### OfType

Selects values, depending on their ability to be cast to a specified type.

```objc
- (instancetype)linq_ofType:(Class)klass;
```
<!--
 Example: 

```objc
```
-->

Selects elements which keys can be cast to a specified type.

```objc
- (instancetype)linq_ofTypeKey:(Class)klass;
```

Selects elements which values can be cast to a specified type.

```objc
- (instancetype)linq_ofTypeValue:(Class)klass;
```

#### Where

 Selects values that are based on a predicate function.

```objc
- (instancetype)linq_where:(BOOL (^)(id item))block;
```

Selects values which satisify key-value condition.

```objc
- (instancetype)linq_where:(BOOL (^)(id key, id value))block;
```

Selects values which keys satisify condition.

```objc
- (instancetype)linq_whereKey:(BOOL (^)(id item))block;
```

Selects values which satisify condition.

```objc
- (instancetype)linq_whereValue:(BOOL (^)(id item))block;
```

## Generation Operations

#### Empty

Returns empty array.

```objc
+ (instancetype)linq_empty;
```

#### From:To:

Creates array with integers from to.

```objc
+ (instancetype)linq_from:(NSInteger)from to:(NSInteger)to;
```

#### Repeat

Generates a collection that contains one repeated value.

```objc
+ (instancetype)linq_repeat:(id)element count:(NSInteger)count;
```


## Grouping Operations


#### GroupBy

 Returns NSDictionary of groups that share a common
 attribute defined by selector. Each group is defined
 as a dictionary entry whose key is a result of a selector
 and its value is an array of all elements that return
 the same key, i.e. selector(element) -> key.


` { key <- selector(element), value <- [element : key = selector(element)] }`


```objc
- (NSDictionary *)linq_groupBy:(id (^)(id item))block;
```

Example: 

```objc
NSArray *words = @[@"Adam", @"Anthony",
					@"Ben", @"Bob",
					@"Michael", @"Max", @"Matt",
					@"Simon"];
NSDictionary *results = [self.input_words linq_groupBy:^id(id item) {
    return [item substringToIndex:1];
}];
// Result is:
// {
// 		{"A" : @[@"Adam", @"Anthony"]},
// 		{"B" : @[@"Ben", @"Bob"]},
// 		{"M" : @[@"Michael", @"Max", @"Matt"]}
//		{"S" : @[@"Simon"]}
// }
```

#### ToLookup

Returns array of NSDictionaries by entering each element
into a NSDictionary whose key is a result of a selector
and its value is an element: ` { key <- selector(element), value <- element}`
 
```objc
- (instancetype)linq_toLookup:(id (^)(id item))block;
```

<!--
Example: 

```objc
```
-->

#### Lookup

Helps to filter results of toLookup: method.
Returns array of NSDictionaries with the same key.

```objc
- (instancetype)linq_lookup:(id)key;
```


<!--## Join Operations-->

<!--## Element Operations-->

<!--## Equality Operations-->


## Partitioning Operations

#### Skip

Skips elements up to a specified position in a collection.

```objc
- (NSArray *)linq_skip:(NSInteger)count;
- (NSDictionary *)linq_skip:(NSInteger)count;
```

<!--
Example: 

```objc
NSArray *result = [[NSArray linq_from:1 to:10] linq_skip:5];
// result is @[@6, @7, @8, @9, @10]
```
-->

#### Take

Takes elements up to a specified position in a collection.

```objc
- (NSArray *)linq_take:(NSInteger)count;
- (NSDictionary *)linq_take:(NSInteger)count;
```
<!--
Example: 

```objc
NSArray *result = [[NSArray linq_from:1 to:10] linq_take:5];
// result is @[@1, @2, @3, @4, @5]
```
-->

## Projection Operations

#### Select

 Projects values that are based on a transform function.

```objc
- (instancetype)linq_select:(id (^)(id item))block;
```

The example below adds 10 to each element in the collection.

```objc
NSArray *result = [[NSArray linq_from:1 to:5] linq_select:^id(id item) {
    return [NSNumber numberWithInteger:([item integerValue] + 10)];
}];
// result is @[@11, @12, @13, @14, @15];
```

#### Select Many

 Projects sequences of values that are based on a transform
 function and then flattens them into one sequence.

```objc
- (instancetype)linq_selectMany:(id (^)(id item))block;
```

This example returns words of each string of the collection.

```objc
NSArray *input = @[@"an apple a day", @"the quick brown fox"];
NSArray *result = [input linq_selectMany:^id(id item) { 
    return [item componentsSeparatedByString:@" "]; 
}]; 
// result is @[@"an", @"apple", @"a", @"day", 
//			@"the", @"quick", @"brown", @"fox"]
//
```


## Quantifier Operations

#### All

Determines whether all the elements in a sequence satisfy a condition.

```objc
- (BOOL)linq_all:(BOOL (^)(id item))block;
- (BOOL)linq_all:(BOOL (^)(id key, id value))block;
```

#### Any

Determines whether any elements in a sequence satisfy a condition.
 
```objc
- (BOOL)linq_any:(BOOL (^)(id item))block;
- (BOOL)linq_any:(BOOL (^)(id key, id value))block;
```

## Set Operations

#### Distinct

 Removes duplicate values from a collection.

```objc
- (instancetype)linq_distinct;
```

#### Except

 Returns the collection without the elements
 that appear in a second collection.

```objc
- (instancetype)linq_except:(NSArray *)other;
- (instancetype)linq_except:(NSDictionary *)other;
```

#### Intersect

 Returns the set intersection, which means elements
 that appear in each of two collections.

```objc
- (instancetype)linq_intersect:(NSArray *)other;
- (instancetype)linq_intersect:(NSDictionary *)other;
```

#### Union

 Returns the set union, which means unique elements
 that appear in either of two collections.

```objc
- (NSArray *)linq_union:(NSArray *)other;
```

Merges to dictionaries by returning the set union
of unique elements which keys appear in either of
two dictionaries.

```objc
- (NSDictionary *)linq_merge:(NSDictionary *)other;
```


## Sorting Operations

#### OrderBy

 Sorts values in ascending order.

```objc
- (instancetype)linq_orderByAscending;
```

 Sorts values in descending order.

```objc
- (instancetype)linq_orderByDescending;
```

 Sorts elements of a collection depending on an element's key.

```objc
- (instancetype)linq_orderByKey:(NSString *)key ascending:(BOOL)ascending;
```


#### Reverse

 Reverses the order of the elements in a collection.

```objc
- (instancetype)linq_reverse;
```

## Contributing

1. Fork it.
2. Create your feature branch (`git checkout -b new-feature`).
3. Commit your changes (`git commit -am 'Added new-feature'`).
4. Push to the branch (`git push origin new-feature`).
5. Create new Pull Request.


<!--- - - 

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/michalkonturek/linq4obj-c/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
-->
