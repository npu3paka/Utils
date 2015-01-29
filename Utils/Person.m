//
//  Person.m
//  Utils
//
//  Created by 158ltd Developer on 1/23/15.
//  Copyright (c) 2015 158ltd. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end
