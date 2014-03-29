//
//  DRBLShot.m
//  DribbbleKit
//
//  Created by Scott Petit on 8/12/13.
//  Copyright (c) 2013 Scott Petit. All rights reserved.
//

#import "DRBLShot.h"

@implementation DRBLShot

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             NSStringFromSelector(@selector(identifier)) : @"id",
             NSStringFromSelector(@selector(shortURL)) : @"short_url",
             NSStringFromSelector(@selector(imageURL)) : @"image_url",
             NSStringFromSelector(@selector(imageTeaserURL)) : @"image_teaser_url",
             NSStringFromSelector(@selector(image400URL)) : @"image_400_url"
             };
}

@end
