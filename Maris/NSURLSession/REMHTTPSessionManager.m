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

- (instancetype)initWithBaseURL:(NSURL *)url
{
    return [self initWithBaseURL:url sessionConfiguration:nil];
}

- (instancetype)initWithBaseURL:(NSURL *)url sessionConfiguration:(NSURLSessionConfiguration *)configuration
{
    self = [super initWithBaseURL:url sessionConfiguration:configuration];
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
    NSURLSessionDataTask *dataTask = [self GET:URLString parameters:parameters success:success failure:failure];
    
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
    NSURLSessionDataTask *dataTask = [self HEAD:URLString parameters:parameters success:success failure:failure];
    
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
    NSURLSessionDataTask *dataTask = [self POST:URLString parameters:parameters success:success failure:failure];
    
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
    NSURLSessionDataTask *dataTask = [self POST:URLString parameters:parameters constructingBodyWithBlock:block success:success failure:failure];
    
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
    NSURLSessionDataTask *dataTask = [self PUT:URLString parameters:parameters success:success failure:failure];
    
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
    NSURLSessionDataTask *dataTask = [self PATCH:URLString parameters:parameters success:success failure:failure];
    
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
    NSURLSessionDataTask *dataTask = [self DELETE:URLString parameters:parameters success:success failure:failure];
    
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
