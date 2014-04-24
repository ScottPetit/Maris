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

@end

@implementation REMCompoundResponseSerializer

#pragma mark - AFHTTPResponseSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error
{
    NSURL *URL = [response URL];
    
    id<AFURLResponseSerialization> responseSerializer = [self.mutableDictionary objectForKey:[URL absoluteString]];
    
    id responseObject = nil;
    
    if (!responseSerializer)
    {
        NSLog(@"No response serializer registered for URL - %@", URL);
        responseObject = [super responseObjectForResponse:response data:data error:error];
    }
    else
    {
        responseObject = [responseSerializer responseObjectForResponse:response data:data error:error];
    }
    
    return responseObject;
}

#pragma mark - Public

- (void)registerResponseSerializer:(id<AFURLResponseSerialization>)responseSerializer withDataTask:(NSURLSessionDataTask *)dataTask
{
    if (dataTask && responseSerializer)
    {
        NSURLRequest *request = [dataTask originalRequest];
        NSURL *URL = [request URL];
        
        [self.mutableDictionary setObject:responseSerializer forKey:[[URL absoluteString] copy]];
    }
    else
    {
        NSLog(@"Attempting to register either a nil response serializer - %@ or a nil datatask - %@.  Currently you are protected from asserting but that is not gauranteed to always be the case.", responseSerializer, dataTask);
    }
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

#pragma mark - NSCoding

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    if (self)
    {
        _mutableDictionary = [decoder decodeObjectForKey:NSStringFromSelector(@selector(mutableDictionary))];
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
