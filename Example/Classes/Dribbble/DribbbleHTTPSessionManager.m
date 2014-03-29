//
//  DribbbleHTTPSessionManager.m
//  Maris
//
//  Created by Scott Petit on 3/29/14.
//  Copyright (c) 2014 Scott Petit. All rights reserved.
//

#import "DribbbleHTTPSessionManager.h"
#import "DRBLShot.h"

@implementation DribbbleHTTPSessionManager

+ (instancetype)sharedManager
{
    static id _sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseURL = [NSURL URLWithString:@"http://api.dribbble.com/"];
        _sharedManager = [[self alloc] initWithBaseURL:baseURL];
    });
    return _sharedManager;
}

#pragma mark - Public

- (void)shotsWithSuccess:(DribbbleSessionManagerSuccess)success failure:(DribbbleSessionManagerFailure)failure
{
    [self GET:@"shots/popular" parameters:nil modelClass:[DRBLShot class] keyPath:@"shots" success:success failure:failure];
}

@end
