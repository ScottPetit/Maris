//
//  ESPNAthlete.h
//  Maris
//
//  Created by Scott Petit on 3/30/14.
//  Copyright (c) 2014 Scott Petit. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface ESPNAthlete : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign, readonly) NSInteger identifier;
@property (nonatomic, copy, readonly) NSString *firstName;
@property (nonatomic, copy, readonly) NSString *lastName;
@property (nonatomic, copy, readonly) NSString *fullName;
@property (nonatomic, copy, readonly) NSString *displayName;
@property (nonatomic, copy, readonly) NSString *shortName;

@end
