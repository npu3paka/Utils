//
//  NSData+Utils.h
//  Utils
//
//  Created by 158ltd Developer on 1/23/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Utils)

- (NSData *)dataWithObject:(id)object;

- (id)convertDataToObject;

- (NSString*)md5;
@end
