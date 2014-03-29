//
//  REMCompoundResponseSerializer.m
//  Maris
//
//  Created by Scott Petit on 3/29/14.
//  Copyright (c) 2014 Scott Petit. All rights reserved.
//

#import "REMCompoundResponseSerializer.h"

@interface REMCompoundResponseSerializer ()

@property (nonatomic, strong) NSMutableDictionary *mutableDictionary;

- (NSArray *)serializers;

@end

@implementation REMCompoundResponseSerializer

#pragma mark - AFHTTPResponseSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error
{
    NSURL *URL = [response URL];
    
    id<AFURLResponseSerialization> responseSerializer = [self.mutableDictionary objectForKey:[URL absoluteString]];
    
    return [responseSerializer responseObjectForResponse:response data:data error:error];
}

#pragma mark - Public

- (void)registerResponseSerializer:(id<AFURLResponseSerialization>)responseSerializer toDataTask:(NSURLSessionDataTask *)dataTask
{
    NSURLRequest *request = [dataTask originalRequest];
    NSURL *URL = [request URL];
    
    [self.mutableDictionary setObject:responseSerializer forKey:[[URL absoluteString] copy]];
}

#pragma mark - Accessors

- (NSMutableDictionary *)mutableDictionary
{
    if (!_mutableDictionary)
    {
        _mutableDictionary = [NSMutableDictionary dictionary];
    }
    return _mutableDictionary;
}

- (NSArray *)responseSerializers
{
    return [self.mutableDictionary allValues];
}

- (NSArray *)serializers
{
    return [self.mutableDictionary allValues];
}

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    if (self)
    {
        self.mutableDictionary = [decoder decodeObjectForKey:NSStringFromSelector(@selector(mutableDictionary))];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    [super encodeWithCoder:coder];
    
    [coder encodeObject:self.mutableDictionary forKey:NSStringFromSelector(@selector(mutableDictionary))];
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    REMCompoundResponseSerializer *serializer = [[[self class] allocWithZone:zone] init];
    serializer.mutableDictionary = self.mutableDictionary;
    
    return serializer;
}

@end
