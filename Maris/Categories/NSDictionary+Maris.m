//
//  NSDictionary+Maris.m
//  Maris
//
//  Created by Scott Petit on 3/29/14.
//  Copyright (c) 2014 Scott Petit. All rights reserved.
//

#import "NSDictionary+Maris.h"

@implementation NSDictionary (Maris)

- (id)rem_objectForKeyPath:(NSString *)keyPath
{
    id object = self;
    
    NSArray *keys = [keyPath componentsSeparatedByString:@"."];
    for (NSString *key in keys)
    {
        if ([object isKindOfClass:[NSDictionary class]])
        {
            object = [object objectForKey:key];
        }
        else
        {
            object = nil;
            break;
        }
    }
    
    return object;
}

@end
