//
//  NSDate+Utils.h
//  Utils
//
//  Created by 158ltd Developer on 1/23/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const kDateFormatShortMonthFullYearTime;

#define GHTimeIntervalMinute (60)
#define GHTimeIntervalHour (GHTimeIntervalMinute * 60)
#define GHTimeIntervalDay (GHTimeIntervalHour * 24)
#define GHTimeIntervalWeek (GHTimeIntervalDay * 7)
#define GHTimeIntervalYear (GHTimeIntervalDay * 365.242199)
#define GHTimeIntervalMax (DBL_MAX)

@interface NSDate (Utils)

///------------------------------------------
/// @name Calculating First Day Of This / Previous / Following Month
///------------------------------------------

/**
 Returns Date as NSString with Format.
 */
- (NSString *)stringWithFormat:(NSString*)format;

///------------------------------------------
/// @name Calculating First Day Of This / Previous / Following Month
///------------------------------------------

/**
 Returns a the first day of This Month.
 */
- (NSDate *)firstDayOfTheMonth;

/**
 Returns a the first day of Previous Month.
 */
- (NSDate *)firstDayOfThePreviousMonth;

/**
 Returns a the first day of Following Month.
 */
- (NSDate *)firstDayOfTheFollowingMonth;

- (NSDateComponents *)componentsForMonthDayAndYear;

///------------------------------------------
/// @name Calculating Day of Week / Number of Weeks in Month
///------------------------------------------

/**
 Returns a the day of the week.
 */
- (NSUInteger)weekday;

/**
 Returns number of days in the current Month
 */
- (NSUInteger)numberOfDaysInMonth;

///-----------------------------------------
/// @name Calculating Beginning / End of Day
///-----------------------------------------

/**
 Returns a new date with first second of the day of the receiver.
 */
- (NSDate *)beginningOfDay;

/**
 Returns a new date with the last second of the day of the receiver.
 */
- (NSDate *)endOfDay;

///------------------------------------------
/// @name Calculating Beginning / End of Week
///------------------------------------------

/**
 Returns a new date with first second of the first weekday of the receiver, taking into account the current calendar's `firstWeekday` property.
 */
- (NSDate *)beginningOfWeek;

/**
 Returns a new date with last second of the last weekday of the receiver, taking into account the current calendar's `firstWeekday` property.
 */
- (NSDate *)endOfWeek;

///-------------------------------------------
/// @name Calculating Beginning / End of Month
///-------------------------------------------

/**
 Returns a new date with the first second of the first day of the month of the receiver.
 */
- (NSDate *)beginningOfMonth;

/**
 Returns a new date with the last second of the last day of the month of the receiver.
 */
- (NSDate *)endOfMonth;

///------------------------------------------
/// @name Calculating Beginning / End of Year
///------------------------------------------

/**
 Returns a new date with the first second of the first day of the year of the receiver.
 */
- (NSDate *)beginningOfYear;

/**
 Returns a new date with the last second of the last day of the year of the receiver.
 */
- (NSDate *)endOfYear;

///------------------------------------------
/// @name Calculating TimeStamp
///------------------------------------------

/**
 Returns the TimeStamp
 */
+ (NSTimeInterval) timeStamp;






@end
