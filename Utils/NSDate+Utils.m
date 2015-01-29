//
//  NSDate+Utils.m
//  Utils
//
//  Created by 158ltd Developer on 1/23/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import "NSDate+Utils.h"

#if (defined(__IPHONE_OS_VERSION_MAX_ALLOWED) && __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000) || (defined(__MAC_OS_X_VERSION_MAX_ALLOWED) && __MAC_OS_X_VERSION_MAX_ALLOWED >= 1090)
#define CYCalendarUnitYear NSCalendarUnitYear
#define CYCalendarUnitMonth NSCalendarUnitMonth
#define CYCalendarUnitWeek NSCalendarUnitWeekOfYear
#define CYCalendarUnitDay NSCalendarUnitDay
#define CYCalendarUnitHour NSCalendarUnitHour
#define CYCalendarUnitMinute NSCalendarUnitMinute
#define CYCalendarUnitSecond NSCalendarUnitSecond
#define CYCalendarUnitWeekday NSCalendarUnitWeekday
#define CYDateComponentUndefined NSDateComponentUndefined
#else
#define CYCalendarUnitYear NSYearCalendarUnit
#define CYCalendarUnitMonth NSMonthCalendarUnit
#define CYCalendarUnitWeek NSWeekOfYearCalendarUnit
#define CYCalendarUnitDay NSDayCalendarUnit
#define CYCalendarUnitHour NSHourCalendarUnit
#define CYCalendarUnitMinute NSMinuteCalendarUnit
#define CYCalendarUnitSecond NSSecondCalendarUnit
#define CYCalendarUnitWeekday NSWeekdayCalendarUnit
#define CYDateComponentUndefined NSUndefinedDateComponent
#endif

@implementation NSDate (Utils)

- (NSString*) stringWithFormat:(NSString*)format
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate:self];
}

- (NSString *)convertDateToStringWithFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    NSString *dateStr = [dateFormatter stringFromDate:self];
    return dateStr;
}

- (NSDate *)firstDayOfTheMonth
{
    NSDate *d = nil;
    BOOL ok = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitMonth startDate:&d interval:NULL forDate:self];
    NSAssert1(ok, @"Failed to calculate the first day the month based on %@", self);
    return d;
}

- (NSDate *)firstDayOfThePreviousMonth
{
    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.month = -1;
    return [[[NSCalendar currentCalendar] dateByAddingComponents:c toDate:self options:0] firstDayOfTheMonth];
}

- (NSDate *)firstDayOfTheFollowingMonth
{
    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.month = 1;
    return [[[NSCalendar currentCalendar] dateByAddingComponents:c toDate:self options:0] firstDayOfTheMonth];
}

- (NSDateComponents *)componentsForMonthDayAndYear
{
    return [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self];
}

- (NSUInteger)weekday
{
    NSTimeInterval interval = [self timeIntervalSinceReferenceDate]/(60.0*60.0*24.0);
    //mod 7 the number of days to identify day
    long dayix=((long)interval) % 7;
    return dayix+1;
//    return [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitWeekOfMonth forDate:self];
}

- (NSUInteger)numberOfDaysInMonth
{
    return [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self].length;
}

- (NSDate *)beginningOfDay {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:CYCalendarUnitYear | CYCalendarUnitMonth | CYCalendarUnitDay fromDate:self];
    
    return [calendar dateFromComponents:components];
}

- (NSDate *)endOfDay {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.day = 1;
    
    return [[calendar dateByAddingComponents:components toDate:[self beginningOfDay] options:0] dateByAddingTimeInterval:-1];
}

#pragma mark -

- (NSDate *)beginningOfWeek {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:CYCalendarUnitYear | CYCalendarUnitMonth | CYCalendarUnitWeekday | CYCalendarUnitDay fromDate:self];
    
    NSInteger offset = components.weekday - (NSInteger)calendar.firstWeekday;
    components.day = components.day - offset;
    
    return [calendar dateFromComponents:components];
}

- (NSDate *)endOfWeek {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.weekOfMonth = 1;
    
    return [[calendar dateByAddingComponents:components toDate:[self beginningOfWeek] options:0] dateByAddingTimeInterval:-1];
}

#pragma mark -

- (NSDate *)beginningOfMonth {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:CYCalendarUnitYear | CYCalendarUnitMonth fromDate:self];
    
    return [calendar dateFromComponents:components];
}

- (NSDate *)endOfMonth {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.month = 1;
    
    return [[calendar dateByAddingComponents:components toDate:[self beginningOfMonth] options:0] dateByAddingTimeInterval:-1];
}

#pragma mark -

- (NSDate *)beginningOfYear {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [calendar components:CYCalendarUnitYear fromDate:self];
    
    return [calendar dateFromComponents:components];
}

- (NSDate *)endOfYear {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.year = 1;
    
    return [[calendar dateByAddingComponents:components toDate:[self beginningOfYear] options:0] dateByAddingTimeInterval:-1];
}

+ (NSTimeInterval) timeStamp {
    return [[NSDate date] timeIntervalSince1970] * 1000;
}

@end
