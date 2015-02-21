//
//  NSError+Maris.m
//  Maris
//
//  Created by Scott Petit on 2/21/15.
//  Copyright (c) 2015 Scott Petit. All rights reserved.
//

#import "NSError+Maris.h"

NSString * const MarisErrorDomain = @"com.maris.error";

// Error Codes
NSInteger const MarisFailingKeyPathErrorCode = 707;

@implementation NSError (Maris)

+ (NSError *)marisErrorWithCode:(NSInteger)errorCode
{
    return [self marisErrorWithCode:errorCode error:nil];
}

+ (NSError *)marisErrorWithCode:(NSInteger)errorCode error:(NSError *)error
{
    return [self marisErrorWithCode:errorCode description:nil error:error];
}

+ (NSError *)marisErrorWithCode:(NSInteger)errorCode description:(NSString *)errorDescription error:(NSError *)error
{
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    
    if (error) {
        userInfo[NSUnderlyingErrorKey] = error;
    }
    
    if (errorDescription) {
        userInfo[NSLocalizedDescriptionKey] = errorDescription;
    }
    
    NSError *marisError = [NSError errorWithDomain:MarisErrorDomain code:errorCode userInfo:userInfo];
    return marisError;
}


@end
