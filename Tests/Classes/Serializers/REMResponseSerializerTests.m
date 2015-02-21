//
//  REMResponseSerializerTests.m
//  Maris
//
//  Created by Scott Petit on 3/29/14.
//  Copyright (c) 2014 Scott Petit. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "REMTestUtility.h"
#import "REMResponseSerializer.h"
#import "NSError+Maris.h"
#import <OCMock/OCMock.h>
#import "ESPNAthlete.h"

@interface REMResponseSerializerTests : XCTestCase

@property (nonatomic, strong) REMResponseSerializer *responseSerializer;
@property (nonatomic, strong) Class modelClass;
@property (nonatomic, strong) NSString *keyPath;
@property (nonatomic, strong) NSHTTPURLResponse *URLResponse;

- (void)validateAthleteIsRogerMaris:(ESPNAthlete *)athlete;

@end

@implementation REMResponseSerializerTests

- (void)setUp
{
    [super setUp];
    
    self.modelClass = [ESPNAthlete class];
    self.keyPath = @"sport.league.athletes";
    
    self.responseSerializer = [REMResponseSerializer serializerWithModelClass:self.modelClass keyPath:self.keyPath];
    
    NSURL *URL = [NSURL URLWithString:@"http://google.com"];
    self.URLResponse = [[NSHTTPURLResponse alloc] initWithURL:URL statusCode:200 HTTPVersion:@"1.1" headerFields:@{@"Content-Type": @"application/json"}];
}

- (void)tearDown
{
    self.responseSerializer = nil;
    self.modelClass = nil;
    
    [super tearDown];
}

- (void)testResponseSerializerIsNotNil
{
    XCTAssertNotNil(self.responseSerializer);
}

- (void)testResponseSerializerStoresModelClassOnInit
{
    XCTAssertEqualObjects([self.responseSerializer modelClass], self.modelClass);
}

- (void)testThatResponseSerializerStoresKeyPathOnInit
{
    XCTAssertEqualObjects([self.responseSerializer keyPath], self.keyPath);
}

- (void)testThatResponseSerializerCanBeCopied
{
    XCTAssertNoThrow([self.responseSerializer copy]);
}

- (void)testThatResponseSerializerCopiesModelClassCorrectly
{
    REMResponseSerializer *copy = [self.responseSerializer copy];
    
    XCTAssertEqualObjects([copy modelClass], self.modelClass);
}

- (void)testThatResponseSerializerCopiesKeyPathCorrectly
{
    REMResponseSerializer *copy = [self.responseSerializer copy];
    
    XCTAssertEqualObjects([copy keyPath], self.keyPath);
}

- (void)testThatResponseSerializerCanDeserializeMultipleObjects
{
    NSData *data = [REMTestUtility dataForJSONWithFileName:@"baseball"];
    NSArray *athletes = [self.responseSerializer responseObjectForResponse:self.URLResponse data:data error:NULL];
    
    XCTAssertEqual([athletes count], (NSUInteger) 2);
    
    ESPNAthlete *rogerMaris = [athletes firstObject];
    
    [self validateAthleteIsRogerMaris:rogerMaris];
    
    ESPNAthlete *mickeyMantle = [athletes lastObject];
    
    XCTAssertEqual([mickeyMantle identifier], 3115);
    XCTAssertEqualObjects([mickeyMantle firstName], @"Mickey");
    XCTAssertEqualObjects([mickeyMantle lastName], @"Mantle");
    XCTAssertEqualObjects([mickeyMantle fullName], @"Mickey Charles Mantle");
    XCTAssertEqualObjects([mickeyMantle displayName], @"Mickey Mantle");
    XCTAssertEqualObjects([mickeyMantle shortName], @"M. Mantle");
}

- (void)testThatResponseSerializerCanDeserializeASingleObject
{
    NSData *data = [REMTestUtility dataForJSONWithFileName:@"baseball"];
   
    REMResponseSerializer *serializer = [REMResponseSerializer serializerWithModelClass:[ESPNAthlete class] keyPath:@"athlete"];
    ESPNAthlete *athlete = [serializer responseObjectForResponse:self.URLResponse data:data error:NULL];
    
    [self validateAthleteIsRogerMaris:athlete];
}

- (void)testThatTryingToDeserializeAModelWithAnInappropriateKeyPathReturnsAnAppropriateError
{
    NSData *data = [REMTestUtility dataForJSONWithFileName:@"baseball"];
    
    REMResponseSerializer *serializer = [REMResponseSerializer serializerWithModelClass:[ESPNAthlete class] keyPath:@"athl"];
    NSError *error = nil;
    id response = [serializer responseObjectForResponse:self.URLResponse data:data error:&error];
    
    // Response should be nil because there is no value for the key path 'athl'
    XCTAssertNil(response);
    XCTAssertNotNil(error);
    XCTAssertEqualObjects(error.domain, MarisErrorDomain);
    XCTAssertEqual(error.code, MarisFailingKeyPathErrorCode);
}

#pragma mark - Private

- (void)validateAthleteIsRogerMaris:(ESPNAthlete *)athlete
{
    XCTAssertEqual([athlete identifier], 3114);
    XCTAssertEqualObjects([athlete firstName], @"Roger");
    XCTAssertEqualObjects([athlete lastName], @"Maris");
    XCTAssertEqualObjects([athlete fullName], @"Roger Eugene Maris");
    XCTAssertEqualObjects([athlete displayName], @"Roger Maris");
    XCTAssertEqualObjects([athlete shortName], @"R. Maris");
}

@end
