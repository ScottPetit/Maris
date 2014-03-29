//
//  DribbbleHTTPSessionManager.h
//  Maris
//
//  Created by Scott Petit on 3/29/14.
//  Copyright (c) 2014 Scott Petit. All rights reserved.
//

#import "REMHTTPSessionManager.h"

typedef void (^DribbbleSessionManagerSuccess)(NSURLSessionDataTask *dataTask, id responseObject);
typedef void (^DribbbleSessionManagerFailure)(NSURLSessionDataTask *dataTask, NSError *error);

@interface DribbbleHTTPSessionManager : REMHTTPSessionManager

+ (instancetype)sharedManager;

- (void)shotsWithSuccess:(DribbbleSessionManagerSuccess)success failure:(DribbbleSessionManagerFailure)failure;

@end
