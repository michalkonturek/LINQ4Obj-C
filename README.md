# LINQ for Objective-C

[![Build Status](https://travis-ci.org/michalkonturek/LINQ.png)](https://travis-ci.org/michalkonturek/LINQ)


<!--[![Build Status](https://travis-ci.org/michalkonturek/LINQ.png?branch=develop)](https://travis-ci.org/michalkonturek/LINQ)-->


## Background

## Aggregation Operations


#### Aggregate

 Performs a custom aggregation operation on the values of a collection.

```objc
- (id)LINQ_aggregate:(LINQAccumulatorBlock)accumulatorBlock;
```

Example:

```objc
NSArray *input = @[@"M", @"A", @"R", @"K"];
NSString *result = [input LINQ_aggregate:^id(id item, id aggregate) {
    return [NSString stringWithFormat:@"%@, %@", aggregate, item];
}];	

/*
	Result is a string "M, A, R, K".
*/
```

#### Avg

Calculates the average value of a collection of values.

```objc
- (id)LINQ_avg;
- (id)LINQ_avgForKey:(NSString *)key; 
```

Example: 

```objc

```


#### Count

 Counts the elements in a collection, optionally only 
 those elements that satisfy a predicate function.

```objc
- (NSUInteger)LINQ_count:(LINQConditionBlock)conditionBlock;
```
 
 Example: 

```objc

```


#### Max

 Determines the maximum value in a collection.

```objc
- (id)LINQ_max;
- (id)LINQ_maxForKey:(NSString *)key;
```

Example: 

```objc

```



#### Min

 Determines the minimum value in a collection.

```objc
- (id)LINQ_min;
- (id)LINQ_minForKey:(NSString *)key;
```

Example: 

```objc

```


#### - (id)LINQ_sum;

 Calculates the sum of the values in a collection

```objc
- (id)LINQ_sum;
- (id)LINQ_sumForKey:(NSString *)key;
```
 
 Example: 

```objc

```





<!--## Concatenation Operations-->

<!--## Converting Data Types-->


## Filtering Operations

#### OfType

 Selects values, depending on their ability to be cast to a specified type.

```objc
- (instancetype)LINQ_ofType:(Class)klass;
```

 Example: 

```objc

```

#### Where

 Selects values that are based on a predicate function.

```objc
- (instancetype)LINQ_where:(LINQConditionBlock)conditionBlock;
```

 Example: 

```objc

```


## Generation Operations

#### Empty

Returns empty array.

```objc
+ (instancetype)LINQ_empty;
```

Example: 

```objc

```


#### From:To:

Creates array with integers from to.

```objc
+ (instancetype)LINQ_from:(NSInteger)from to:(NSInteger)to;
```

Example: 

```objc

```


#### Repeat

Generates a collection that contains one repeated value.

```objc
+ (instancetype)LINQ_repeat:(id)element count:(NSInteger)count;
```

Example: 

```objc

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
- (NSDictionary *)LINQ_groupBy:(LINQSelectorBlock)selector;
```

Example: 

```objc

```

#### ToLookup

 Returns array of NSDictionaries by entering each element
 into a NSDictionary whose key is a result of a selector
 and its value is an element: ` { key <- selector(element), value <- element}`
 

```objc
- (instancetype)LINQ_toLookup:(LINQSelectorBlock)selector;
```

Example: 

```objc

```

#### Lookup

 Helps to filter results of toLookup: method.
 Returns array of NSDictionaries with the same key.


```objc
- (instancetype)LINQ_lookup:(id)key;
```

Example: 

```objc

```





<!--## Join Operations-->


<!--## Element Operations-->


<!--## Equality Operations-->




## Partitioning Data

#### Skip

Skips elements up to a specified position in a collection.

```objc
- (NSArray *)LINQ_skip:(NSInteger)count;
```

Example: 

```objc

```



#### Take

 Takes elements up to a specified position in a collection.


```objc
- (NSArray *)LINQ_take:(NSInteger)count;
```

Example: 

```objc

```

## Projection Operations

#### Select

 Projects values that are based on a transform function.

```objc
- (instancetype)LINQ_select:(LINQSelectorBlock)selectorBlock;
```

Example: 

```objc

```

#### Select Many

 Projects sequences of values that are based on a transform
 function and then flattens them into one sequence.

```objc
- (instancetype)LINQ_selectMany:(LINQSelectorBlock)selectorBlock;
```

Example: 

```objc

```



<!--
## Quantifier Operations


## Set Operations


## Sorting Data

-->
