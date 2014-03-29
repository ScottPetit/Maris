//
//  REMCompoundResponseSerializer.h
//  Maris
//
//  Created by Scott Petit on 3/29/14.
//  Copyright (c) 2014 Scott Petit. All rights reserved.
//

#import "AFURLResponseSerialization.h"

@interface REMCompoundResponseSerializer : AFCompoundResponseSerializer

- (void)registerResponseSerializer:(id<AFURLResponseSerialization>)responseSerializer toDataTask:(NSURLSessionDataTask *)dataTask;

@end
