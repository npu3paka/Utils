//
//  Utils.m
//  Utils
//
//  Created by 158ltd Developer on 1/23/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import "UILabel+Utils.h"
#import "UIView+ViewUtils.h"

@implementation UILabel (Utils)

- (void) adjustFontToFitMultiline
{
    //CGSize selfSize = self.size;
    CGSize s = [self sizeThatFits:self.size];
    UIFont* font = self.font; //this uses and sets the current font
    CGFloat fSize = [font pointSize];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 60000
    CGFloat minSize = self.minimumScaleFactor * fSize;
#else
    CGFloat minSize = self.minimumFontSize;
#endif
    
    while (s.height > self.height && fSize >= minSize) {
        fSize = fSize * .95; // decrease by 5 % each time
        UIFont* labelFont = [font fontWithSize:fSize];
        self.font = labelFont;
        s = [self sizeThatFits:CGSizeMake(self.width, CGFLOAT_MAX)];
    }
}

@end
