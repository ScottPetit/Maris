//
//  REMCompoundResponseSerializer.h
//  Maris
//
//  Created by Scott Petit on 3/29/14.
//  Copyright (c) 2014 Scott Petit. All rights reserved.
//

#import "AFURLResponseSerialization.h"

@interface REMCompoundResponseSerializer : AFCompoundResponseSerializer

/**
 The default response serializer to use in cases where the component response serailizers does not contain an appropriate response serializer for the given response.
 */
@property (nonatomic, strong) id<AFURLResponseSerialization> defaultSerializer;

- (void)registerResponseSerializer:(id<AFURLResponseSerialization>)responseSerializer withDataTask:(NSURLSessionDataTask *)dataTask;

@end
