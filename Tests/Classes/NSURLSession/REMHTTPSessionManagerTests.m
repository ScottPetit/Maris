//
//  REMHTTPSessionManagerTests.m
//  Maris
//
//  Created by Scott Petit on 4/24/14.
//  Copyright (c) 2014 Scott Petit. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "REMHTTPSessionManager.h"

@interface REMHTTPSessionManagerTests : XCTestCase

@property (nonatomic, strong) REMHTTPSessionManager *sessionManager;
@property (nonatomic, strong) id mockResponseSerializer;

@end

@implementation REMHTTPSessionManagerTests

- (void)setUp
{
    [super setUp];
    
    self.mockResponseSerializer = [OCMockObject niceMockForClass:[REMCompoundResponseSerializer class]];
    
    NSURL *baseURL = [NSURL URLWithString:@"http://www.google.com"];
    self.sessionManager = [[REMHTTPSessionManager alloc] initWithBaseURL:baseURL];
    self.sessionManager.responseSerializer = self.mockResponseSerializer;
}

- (void)tearDown
{
    self.sessionManager = nil;
    self.mockResponseSerializer = nil;
    
    [super tearDown];
}

- (void)testThatAGETRequestRegistersASerializer
{
    [[self.mockResponseSerializer expect] registerResponseSerializer:OCMOCK_ANY withDataTask:OCMOCK_ANY];
    
    [self.sessionManager GET:@"maps" parameters:nil modelClass:[NSObject class] keyPath:nil success:nil failure:nil];
    
    [self.mockResponseSerializer verify];
}

- (void)testThatAHEADRequestRegistersASerializer
{
    [[self.mockResponseSerializer expect] registerResponseSerializer:OCMOCK_ANY withDataTask:OCMOCK_ANY];
    
    [self.sessionManager HEAD:@"maps" parameters:nil modelClass:[NSObject class] keyPath:nil success:nil failure:nil];
    
    [self.mockResponseSerializer verify];
}

- (void)testThatAPOSTRequestRegistersASerializer
{
    [[self.mockResponseSerializer expect] registerResponseSerializer:OCMOCK_ANY withDataTask:OCMOCK_ANY];
    
    [self.sessionManager POST:@"maps" parameters:nil modelClass:[NSObject class] keyPath:nil success:nil failure:nil];
    
    [self.mockResponseSerializer verify];
}

- (void)testThatAPOSTConstructingBodyWithBlockRequestRegistersASerializer
{
    [[self.mockResponseSerializer expect] registerResponseSerializer:OCMOCK_ANY withDataTask:OCMOCK_ANY];
    
    [self.sessionManager POST:@"maps" parameters:nil constructingBodyWithBlock:nil modelClass:[NSObject class] keyPath:nil success:nil failure:nil];
    
    [self.mockResponseSerializer verify];
}

- (void)testThatAPUTRequestRegistersASerializer
{
    [[self.mockResponseSerializer expect] registerResponseSerializer:OCMOCK_ANY withDataTask:OCMOCK_ANY];
    
    [self.sessionManager PUT:@"maps" parameters:nil modelClass:[NSObject class] keyPath:nil success:nil failure:nil];
    
    [self.mockResponseSerializer verify];
}

- (void)testThatAPATCHRequestRegistersASerializer
{
    [[self.mockResponseSerializer expect] registerResponseSerializer:OCMOCK_ANY withDataTask:OCMOCK_ANY];
    
    [self.sessionManager PATCH:@"maps" parameters:nil modelClass:[NSObject class] keyPath:nil success:nil failure:nil];
    
    [self.mockResponseSerializer verify];
}

- (void)testThatADELETERequestRegistersASerializer
{
    [[self.mockResponseSerializer expect] registerResponseSerializer:OCMOCK_ANY withDataTask:OCMOCK_ANY];
    
    [self.sessionManager DELETE:@"maps" parameters:nil modelClass:[NSObject class] keyPath:nil success:nil failure:nil];
    
    [self.mockResponseSerializer verify];
}

@end
