//
//  ESPNAthlete.m
//  Maris
//
//  Created by Scott Petit on 3/30/14.
//  Copyright (c) 2014 Scott Petit. All rights reserved.
//

#import "ESPNAthlete.h"

@implementation ESPNAthlete

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{NSStringFromSelector(@selector(identifier)): @"id"};
}

@end
