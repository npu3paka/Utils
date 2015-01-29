//
//  Utils.m
//  Utils
//
//  Created by 158ltd Developer on 1/23/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import "NSArray-Utils.h"

@implementation NSArray (Utils)

- (NSArray*)reverseArray {
    return [[self reverseObjectEnumerator] allObjects];
}

+(NSArray *)generateArrayWithFirstNumber:(NSInteger)start andRange:(NSInteger)range {
    NSInteger end = start + range;
    return [NSArray intArrayFrom:start to:end];
}

+ (NSArray *)intArrayFrom:(NSInteger)start to:(NSInteger)end {
    NSUInteger count = abs(end - start) + 1;
    NSMutableArray* ret = [NSMutableArray arrayWithCapacity:count];
    NSUInteger idx = 0;
    if (end >= start) {
        for (NSInteger v = start; v <= end; v++) {
            ret[idx++] = @(v);
        }
    } else {
        for (NSInteger v = start; v >= end; v--) {
            ret[idx++] = @(v);
        }
    }
    return ret;
}

- (instancetype)arrayByRemovingObject:(id)object {
    NSMutableArray* ma = [self mutableCopy];
    [ma removeObject:object];
    return [[self class] arrayWithArray:ma];
}

- (id)objAtIndex:(NSUInteger)index {
    return [self objectAtIndex:index withDefault:nil];
}

- (id)objectAtIndex:(NSInteger)index withDefault:(id)defaultValue {

    if (index >= 0 && index < [self count]) return [self objectAtIndex:index];
    return defaultValue;
}

@end