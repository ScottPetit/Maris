//
//  REMHTTPSessionManager.m
//  Maris
//
//  Created by Scott Petit on 3/29/14.
//  Copyright (c) 2014 Scott Petit. All rights reserved.
//

#import "REMHTTPSessionManager.h"
#import "REMResponseSerializer.h"

@interface REMHTTPSessionManager ()

- (void)registerSerializerWithModelClass:(Class)modelClass keyPath:(NSString *)keyPath toDataTask:(NSURLSessionDataTask *)dataTask;

@end

@implementation REMHTTPSessionManager

@dynamic responseSerializer;

- (instancetype)initWithBaseURL:(NSURL *)URL
{
    return [self initWithBaseURL:URL sessionConfiguration:nil];
}

- (instancetype)initWithBaseURL:(NSURL *)URL sessionConfiguration:(NSURLSessionConfiguration *)configuration
{
    self = [super initWithBaseURL:URL sessionConfiguration:configuration];
    if (self)
    {
        self.responseSerializer = [REMCompoundResponseSerializer serializer];
    }
    return self;
}

- (NSURLSessionDataTask *)GET:(NSString *)URLString
                   parameters:(NSDictionary *)parameters
                   modelClass:(__unsafe_unretained Class)modelClass
                      keyPath:(NSString *)keyPath
                      success:(void (^)(NSURLSessionDataTask *, id))success
                      failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    NSURLSessionDataTask *dataTask = [self GET:[URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:parameters success:success failure:failure];
    
    [self registerSerializerWithModelClass:modelClass keyPath:keyPath toDataTask:dataTask];
    
    return dataTask;
}

- (NSURLSessionDataTask *)HEAD:(NSString *)URLString
                    parameters:(NSDictionary *)parameters
                    modelClass:(__unsafe_unretained Class)modelClass
                       keyPath:(NSString *)keyPath
                       success:(void (^)(NSURLSessionDataTask *))success
                       failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    NSURLSessionDataTask *dataTask = [self HEAD:[URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:parameters success:success failure:failure];
    
    [self registerSerializerWithModelClass:modelClass keyPath:keyPath toDataTask:dataTask];
    
    return dataTask;
}

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(NSDictionary *)parameters
                    modelClass:(__unsafe_unretained Class)modelClass
                       keyPath:(NSString *)keyPath
                       success:(void (^)(NSURLSessionDataTask *, id))success
                       failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    NSURLSessionDataTask *dataTask = [self POST:[URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:parameters success:success failure:failure];
    
    [self registerSerializerWithModelClass:modelClass keyPath:keyPath toDataTask:dataTask];
    
    return dataTask;
}

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(NSDictionary *)parameters
     constructingBodyWithBlock:(void (^)(id<AFMultipartFormData>))block
                    modelClass:(__unsafe_unretained Class)modelClass
                       keyPath:(NSString *)keyPath
                       success:(void (^)(NSURLSessionDataTask *, id))success
                       failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    NSURLSessionDataTask *dataTask = [self POST:[URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:parameters constructingBodyWithBlock:block success:success failure:failure];
    
    [self registerSerializerWithModelClass:modelClass keyPath:keyPath toDataTask:dataTask];
    
    return dataTask;
}

- (NSURLSessionDataTask *)PUT:(NSString *)URLString
                   parameters:(NSDictionary *)parameters
                   modelClass:(__unsafe_unretained Class)modelClass
                      keyPath:(NSString *)keyPath
                      success:(void (^)(NSURLSessionDataTask *, id))success
                      failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    NSURLSessionDataTask *dataTask = [self PUT:[URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:parameters success:success failure:failure];
    
    [self registerSerializerWithModelClass:modelClass keyPath:keyPath toDataTask:dataTask];
    
    return dataTask;
}

- (NSURLSessionDataTask *)PATCH:(NSString *)URLString
                     parameters:(NSDictionary *)parameters
                     modelClass:(__unsafe_unretained Class)modelClass
                        keyPath:(NSString *)keyPath
                        success:(void (^)(NSURLSessionDataTask *, id))success
                        failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    NSURLSessionDataTask *dataTask = [self PATCH:[URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:parameters success:success failure:failure];
    
    [self registerSerializerWithModelClass:modelClass keyPath:keyPath toDataTask:dataTask];
    
    return dataTask;
}

- (NSURLSessionDataTask *)DELETE:(NSString *)URLString
                      parameters:(NSDictionary *)parameters
                      modelClass:(__unsafe_unretained Class)modelClass
                         keyPath:(NSString *)keyPath
                         success:(void (^)(NSURLSessionDataTask *, id))success
                         failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    NSURLSessionDataTask *dataTask = [self DELETE:[URLString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] parameters:parameters success:success failure:failure];
    
    [self registerSerializerWithModelClass:modelClass keyPath:keyPath toDataTask:dataTask];
    
    return dataTask;
}

#pragma mark - Private

- (void)registerSerializerWithModelClass:(Class)modelClass keyPath:(NSString *)keyPath toDataTask:(NSURLSessionDataTask *)dataTask
{
    REMResponseSerializer *serializer = [REMResponseSerializer serializerWithModelClass:modelClass keyPath:keyPath];
    [self.responseSerializer registerResponseSerializer:serializer withDataTask:dataTask];
}

@end
