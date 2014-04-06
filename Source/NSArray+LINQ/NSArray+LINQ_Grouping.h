//
//  NSArray+LINQ_Grouping.h
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


#import "NSArray+LINQ.h"

@interface NSArray (LINQ_Grouping)

/**
 Returns NSDictionary of groups that share a common
 attribute defined by selector. Each group is defined
 as a dictionary etnry whose key is a result of a selector
 and its value is an array of all elements that return
 the same key, i.e. selector(element) -> key.
 
 {
 key <- selector(element)
 value <- [element : key == selector(element)]
 }
 
 */
- (NSDictionary *)linq_groupBy:(id (^)(id item))block;

/**
 Returns array of NSDictionaries by entering each element
 into a NSDictionary whose key is a result of a selector
 and its value is an element.
 
 {
 key <- selector(element)
 value <- element
 }
 
 */
- (instancetype)linq_toLookup:(id (^)(id item))block;

/**
 Helps to filter results of toLookup: method.
 Returns array of NSDictionaries with the same key.
 */
- (instancetype)linq_lookup:(id)key;


@end
