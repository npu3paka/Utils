//
//  Utils.h
//  Utils
//
//  Created by 158ltd Developer on 1/29/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSDictionary (Utils)

//new test
- (id)objectForKey:(id)key withDefault:(id)withDefault;

- (double)doubleForKey:(id)key withDefault:(double)withDefault;

- (double)doubleForKey:(id)key;

- (NSInteger)integerForKey:(id)key withDefault:(NSInteger)withDefault;

- (NSInteger)integerForKey:(id)key;

- (NSUInteger)unsignedIntegerForKey:(id)key withDefault:(NSUInteger)withDefault;

- (NSUInteger)unsignedIntegerForKey:(id)key;

- (NSNumber *)numberForKey:(id)key withDefaultInteger:(NSInteger)withDefaultInteger;

- (NSNumber *)numberForKey:(id)key withDefaultDouble:(double)withDefaultDouble;

- (NSNumber *)numberForKey:(id)key;

- (BOOL)boolForKey:(id)key withDefault:(BOOL)withDefault;

- (BOOL)boolForKey:(id)key;

- (NSDate *)dateForKey:(id)key withDefaultDate:(NSDate *)withDefaultDate;

- (NSDate *)dateForKey:(id)key;

@end
