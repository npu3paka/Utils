//
//  UIColor+Utils.m
//  Utils
//
//  Created by 158ltd Developer on 1/23/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import "UIColor+Utils.h"

@implementation UIColor (Utils)

+ (UIColor*) colorWithIntRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue
{
    return [UIColor red:red/255. green:green/255. blue:blue/255. alpha:1.0f];
}

+ (UIColor *)red:(int)red green:(int)green blue:(int)blue alpha:(CGFloat)alpha
{
    UIColor *color = [UIColor colorWithRed:red/255.f green:green/255.f blue:blue/255.f alpha:alpha];
    return color;
}

+ (NSArray *)convertColorToRBG:(UIColor *)uicolor
{
    CGColorRef color  = [uicolor CGColor];
    int numComponents = (int)CGColorGetNumberOfComponents(color);
    NSArray *array = nil;
    
    if (numComponents == 4)
    {
        int rValue, gValue, bValue;
        const CGFloat *components = CGColorGetComponents(color);
        rValue = (int)(components[0] * 255);
        gValue = (int)(components[1] * 255);
        bValue = (int)(components[2] * 255);
        
        array = [NSArray arrayWithObjects:[NSNumber numberWithInt:rValue], [NSNumber numberWithInt:gValue], [NSNumber numberWithInt:bValue], nil];
    }
    
    return array;
}

UIColor* UIColorFromHex(NSInteger colorInHex) {
    return [UIColor colorWithRed:((float) ((colorInHex & 0xFF0000) >> 16)) / 0xFF
                           green:((float) ((colorInHex & 0xFF00)   >> 8))  / 0xFF
                            blue:((float)  (colorInHex & 0xFF))            / 0xFF
                           alpha:1.0];
}

+ (UIColor *)convertHexColorToUIColor:(NSInteger)hexColor {
    return [UIColor colorWithRed:((float) ((hexColor & 0xFF0000) >> 16)) / 0xFF
                           green:((float) ((hexColor & 0xFF00)   >> 8))  / 0xFF
                            blue:((float)  (hexColor & 0xFF))            / 0xFF
                           alpha:1.0];
}

- (UIColor*) brightenBy:(CGFloat)brightnessMod {
    CGFloat hue;
    CGFloat satuation;
    CGFloat brightness;
    CGFloat alpha;
    if ([self getHue:&hue saturation:&satuation brightness:&brightness alpha:&alpha]) {
        brightness = MIN(1., MAX(0., brightness + brightnessMod));
        return [UIColor colorWithHue:hue saturation:satuation brightness:brightness alpha:alpha];
    } else {
        return self;
    }
}

- (UIColor*) darkerColor {
    return [self brightenBy:-.33];
}

- (UIColor*) lighterColor
{
    return [self brightenBy:.33];
}

@end
