//
//  NSError+Maris.h
//  Maris
//
//  Created by Scott Petit on 2/21/15.
//  Copyright (c) 2015 Scott Petit. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const MarisErrorDomain;

// Error Codes
extern NSInteger const MarisFailingKeyPathErrorCode;

@interface NSError (Maris)

+ (NSError *)marisErrorWithCode:(NSInteger)errorCode;
+ (NSError *)marisErrorWithCode:(NSInteger)errorCode error:(NSError *)error;
+ (NSError *)marisErrorWithCode:(NSInteger)errorCode description:(NSString *)errorDescription error:(NSError *)error;

@end
