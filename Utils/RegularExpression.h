//
//  RegularExpression.h
//  Utils
//
//  Created by 158ltd Developer on 1/23/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegularExpression : NSObject

+ (BOOL)isValidateEmail:(NSString *)email;
+ (BOOL)isNumber:(NSString *)string;

+ (BOOL)isEnglishWords:(NSString *)string;
+ (BOOL)isValidatePassword:(NSString *)string;
+ (BOOL)isChineseWords:(NSString *)string;

@end
