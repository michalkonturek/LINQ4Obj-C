//
//  LINQ.h
//  LINQ
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


#import <Foundation/Foundation.h>

// Block convenience macros

// Selector macros
// Use the cast variants to explicitly box a non object value.
#define MKLinqSel(__key) (^id(id item){return [item __key];})
#define MKLinqSelCast(__cast, __key) (^id(id item){return @( (__cast) [item __key]);})
#define MKLinqSelInt(__key) MKLinqSelCast(NSInteger, __key)
#define MKLinqSelUInt(__key) MKLinqSelCast(NSUInteger, __key)

// Key path selection macros.
// Values obtained via KVC methods are automatically boxed.
#define MKLinqKeyPath(__keyp) (^id(id item){return [item valueForKeyPath:@#__keyp];})
#define MKLinqKey(__key) (^id(id item){return [item valueForKey:@#__key];})

// Block convenience typedefs
typedef BOOL (^MKLinqCondition)(id item);
typedef id (^MKLinqSelector)(id item);

#import "MKMacros.h"
#import "NSArray+LINQ.h"
#import "NSDictionary+LINQ.h"
