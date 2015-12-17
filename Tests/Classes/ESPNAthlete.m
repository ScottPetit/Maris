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
    NSDictionary *identityProperties = [NSDictionary mtl_identityPropertyMapWithModel:self];
    identityProperties = [identityProperties mtl_dictionaryByAddingEntriesFromDictionary:@{NSStringFromSelector(@selector(identifier)): @"id"}];
    return identityProperties;
}

@end
