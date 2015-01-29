//
//  Utils.m
//  Utils
//
//  Created by 158ltd Developer on 1/29/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import "NSDictionary+Utils.h"
#import "NSDate+Utils.h"

@implementation NSDictionary (Utils)

- (double)doubleForKey:(id)key withDefault:(double)defaultValue {
    id value = [self objectForKey:key];
    if (!value || [value isEqual:[NSNull null]]) return defaultValue;
    return [value doubleValue];
}

- (double)doubleForKey:(id)key {
    return [self doubleForKey:key withDefault:0];
}

- (NSInteger)integerForKey:(id)key withDefault:(NSInteger)defaultValue {
    id value = [self objectForKey:key];
    if (!value || [value isEqual:[NSNull null]]) return defaultValue;
    return [value integerValue];
}

- (NSInteger)integerForKey:(id)key {
    return [self integerForKey:key withDefault:0];
}

- (NSUInteger)unsignedIntegerForKey:(id)key withDefault:(NSUInteger)defaultValue {
    id value = [self objectForKey:key];
    if (!value || [value isEqual:[NSNull null]]) return defaultValue;
    return [value unsignedIntegerValue];
}

- (NSUInteger)unsignedIntegerForKey:(id)key {
    return [self unsignedIntegerForKey:key withDefault:0];
}

- (NSNumber *)numberForKey:(id)key {
    id value = [self objectForKey:key];
    if (!value || [value isEqual:[NSNull null]]) return nil;
    NSAssert([value isKindOfClass:[NSNumber class]], @"Value must be a NSNumber");
    return value;
}

- (NSNumber *)numberForKey:(id)key withDefaultInteger:(NSInteger)defaultValue {
    id value = [self objectForKey:key];
    if (!value || [value isEqual:[NSNull null]]) return [NSNumber numberWithInteger:defaultValue];
    NSAssert([value isKindOfClass:[NSNumber class]], @"Value must be a NSNumber");
    return value;
}

- (NSNumber *)numberForKey:(id)key withDefaultDouble:(double)defaultValue {
    id value = [self objectForKey:key];
    if (!value || [value isEqual:[NSNull null]]) return [NSNumber numberWithDouble:defaultValue];
    NSAssert([value isKindOfClass:[NSNumber class]], @"Value must be a NSNumber");
    return value;
}

- (NSDate *)dateForKey:(id)key {
    return [self dateForKey:key withDefaultDate:nil];
}

- (NSDate *)dateForKey:(id)key withDefaultDate:(NSDate *)defaultValue {
    id value = [self objectForKey:key];
    if (!value || [value isEqual:[NSNull null]]) return defaultValue;
    return [NSDate parseTimeSinceEpoch:value];
}

- (BOOL)boolForKey:(id)key withDefault:(BOOL)defaultValue {
    id value = [self objectForKey:key];
    if (!value || [value isEqual:[NSNull null]]) return defaultValue;
    return [value boolValue];
}

- (BOOL)boolForKey:(id)key {
    return [self boolForKey:key withDefault:NO];
}

- (NSNumber *)boolValueForKey:(id)key withDefault:(BOOL)defaultValue {
    id value = [self objectForKey:key];
    if (!value || [value isEqual:[NSNull null]]) return [NSNumber numberWithBool:defaultValue];
    return [NSNumber numberWithBool:[value boolValue]];
}

- (NSNumber *)boolValueForKey:(id)key {
    return [self boolValueForKey:key withDefault:NO];
}

- (NSData *)dataAsBase64ForKey:(NSString *)key options:(NSDataBase64DecodingOptions)options {
    id value = [self objectForKey:key];
    if (!value || [value isEqual:[NSNull null]]) return nil;
    NSAssert([value isKindOfClass:[NSString class]], @"Value must be a Base64 string");
    return [[NSData alloc] initWithBase64EncodedString:value options:0];
}

- (id)objectForKey:(id)key withDefault:(id)defaultValue {
    id value = [self objectForKey:key];
    if (!value || [value isEqual:[NSNull null]]) return defaultValue;
    return value;
}

- (id)objectForKeyOrNSNull:(id)key {
    return [self objectForKey:key withDefault:[NSNull null]];
}

- (BOOL)hasAllKeys:(NSString *)firstKey, ... {
    va_list vl;
    va_start(vl, firstKey);
    id key = firstKey;
    while(key != nil) {
        id value = [self objectForKey:key];
        if (!value || [value isEqual:[NSNull null]]) return NO;
        key = va_arg(vl, NSString *);
    }
    va_end(vl);
    return YES;
}

- (NSDictionary *)dictionarySubsetWithKeys:(NSArray *)keys {
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:[keys count]];
    for(id key in keys) {
        id value = [self objectForKey:key];
        if (value) [dict setObject:value forKey:key];
    }
    return dict;
}

- (NSDictionary *)compactDictionary {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:[self count]];
    for (id key in self) {
        id obj = [self objectForKey:key];
        if (obj != [NSNull null])
            [dict setObject:obj forKey:key];
    }
    return dict;
}

- (NSString *)queryString {
    return [NSURL dictionaryToQueryString:self];
}

- (NSString *)toJSON:(NSJSONWritingOptions)options error:(NSError **)error {
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:options error:error];
    if (data) return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return nil;
}

@end
