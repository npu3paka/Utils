//
//  UIColor+Utils.h
//  Utils
//
//  Created by 158ltd Developer on 1/23/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Utils)

+ (UIColor*) colorWithIntRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue;

+ (UIColor *)red:(int)red green:(int)green blue:(int)blue alpha:(CGFloat)alpha;

+ (NSArray *)convertColorToRBG:(UIColor *)color;

+ (UIColor *)convertHexColorToUIColor:(NSInteger)hexColor;

/** Creates a darker version of the color object */
- (UIColor*) darkerColor;
/** Creates a lighter version of the color object */
- (UIColor*) lighterColor;

@end
