//
//  Utils.h
//  Utils
//
//  Created by 158ltd Developer on 1/23/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Utils)

- (id)objAtIndex:(NSUInteger)index;

- (NSArray*) reverseArray;

+ (NSArray *) generateArrayWithFirstNumber:(NSInteger)start andRange:(NSInteger)range;

+ (NSArray*) intArrayFrom:(NSInteger)start to:(NSInteger)end;

- (instancetype) arrayByRemovingObject:(id)object;

- (id)objectAtIndex:(NSInteger)index withDefault:(id)defaultValue;

@end
