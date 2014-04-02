//
//  REMTestUtility.m
//  Maris
//
//  Created by Scott Petit on 3/30/14.
//  Copyright (c) 2014 Scott Petit. All rights reserved.
//

#import "REMTestUtility.h"

@implementation REMTestUtility

+ (NSData *)dataForJSONWithFileName:(NSString *)fileName
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSURL *URL = [bundle URLForResource:fileName withExtension:@"json"];
    NSData *data = [NSData dataWithContentsOfURL:URL];
    
    return data;
}

@end
