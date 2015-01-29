//
//  NSString+StringUtils.h
//  Utils
//
//  Created by 158ltd Developer on 1/23/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (StringUtils)

- (int)wordsCount;

- (NSString *)URLDecodedString;
- (NSString *)URLEncodedString;
- (NSString *)encodeStringWithUTF8;
- (NSUInteger)byteLengthWithEncoding:(NSStringEncoding)encoding;
- (NSString *) md5;

- (NSString *) escapeAll;
- (NSDate *)convertStringToDateWithFormat:(NSString *)format;

@end
