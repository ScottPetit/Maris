//
//  REMCompoundResponseSerializerTests.m
//  Maris
//
//  Created by Scott Petit on 3/31/14.
//  Copyright (c) 2014 Scott Petit. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "REMCompoundResponseSerializer.h"
#import <OCMock/OCMock.h>

@interface REMCompoundResponseSerializerTests : XCTestCase

@property (nonatomic, strong) REMCompoundResponseSerializer *responseSerializer;

@end

@implementation REMCompoundResponseSerializerTests

- (void)setUp
{
    [super setUp];

    self.responseSerializer = [REMCompoundResponseSerializer serializer];
}

- (void)tearDown
{
    self.responseSerializer = nil;
    
    [super tearDown];
}

- (void)testRegisteringWithANilReponseSerializerDoesntThrow
{
    XCTAssertNoThrow([self.responseSerializer registerResponseSerializer:nil withDataTask:OCMOCK_ANY]);
}

- (void)testRegisteringWithANilDataTaskDoesntThrow
{
    XCTAssertNoThrow([self.responseSerializer registerResponseSerializer:OCMOCK_ANY withDataTask:nil]);
}

- (void)testARegisteredResponseSerializerIsAddedToResponseSerializers
{
    id<AFURLResponseSerialization>serialzier = [AFHTTPResponseSerializer serializer];
    
    NSURL *URL = [NSURL URLWithString:@"http://google.com"];
    id mockDataTask = [self mockDataTaskForURL:URL];
    
    [self.responseSerializer registerResponseSerializer:serialzier withDataTask:mockDataTask];
    
    XCTAssertEqual([[self.responseSerializer responseSerializers] count], 1);
    XCTAssertEqualObjects([[self.responseSerializer responseSerializers] firstObject], serialzier);
}

- (void)testARegisteredResponseSerializerIsCalledWhenTheURLMarches
{
    id mockSerializer = [OCMockObject mockForProtocol:@protocol(AFURLResponseSerialization)];
    [[mockSerializer expect] responseObjectForResponse:OCMOCK_ANY data:OCMOCK_ANY error:[OCMArg anyObjectRef]];
    
    NSURL *URL = [NSURL URLWithString:@"http://google.com"];
    id mockDataTask = [self mockDataTaskForURL:URL];
    id mockURLResponse = [self mockURLResponseWithURL:URL];
    
    [self.responseSerializer registerResponseSerializer:mockSerializer withDataTask:mockDataTask];
    [self.responseSerializer responseObjectForResponse:mockURLResponse data:nil error:NULL];
    
    [mockSerializer verify];
}

#pragma mark - Helpers

- (id)mockDataTaskForURL:(NSURL *)URL
{
    NSURLRequest *URLRequest = [[NSURLRequest alloc] initWithURL:URL];
    id mockDataTask = [OCMockObject mockForClass:[NSURLSessionDataTask class]];
    [[[mockDataTask stub] andReturn:URLRequest] originalRequest];
    
    return mockDataTask;
}

- (id)mockURLResponseWithURL:(NSURL *)URL
{
    id mockURLResponse = [OCMockObject mockForClass:[NSURLResponse class]];
    [[[mockURLResponse stub] andReturn:URL] URL];
    
    return mockURLResponse;
}

@end
