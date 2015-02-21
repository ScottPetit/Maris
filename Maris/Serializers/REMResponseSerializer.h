//
//  REMResponseSerializer.h
//  Maris
//
//  Created by Scott Petit on 3/29/14.
//  Copyright (c) 2014 Scott Petit. All rights reserved.
//

#import "AFURLResponseSerialization.h"

@interface REMResponseSerializer : AFJSONResponseSerializer

+ (instancetype)serializerWithModelClass:(Class)modelClass keyPath:(NSString *)keyPath;
- (instancetype)initWithModelClass:(Class)modelClass keyPath:(NSString *)keyPath;

@property (nonatomic, strong, readonly) Class modelClass;
@property (nonatomic, copy, readonly) NSString *keyPath;

@end
