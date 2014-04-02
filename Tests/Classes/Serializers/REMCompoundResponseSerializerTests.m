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
    
    NSURLRequest *URLRequest = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://google.com"]];
    id mockDataTask = [OCMockObject mockForClass:[NSURLSessionDataTask class]];
    [[[mockDataTask stub] andReturn:URLRequest] originalRequest];
    
    [self.responseSerializer registerResponseSerializer:serialzier withDataTask:mockDataTask];
    
    XCTAssertEqual([[self.responseSerializer responseSerializers] count], 1);
    XCTAssertEqualObjects([[self.responseSerializer responseSerializers] firstObject], serialzier);
}

@end
