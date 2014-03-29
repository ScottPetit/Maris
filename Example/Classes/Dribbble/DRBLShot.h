//
//  DRBLShot.h
//  DribbbleKit
//
//  Created by Scott Petit on 8/12/13.
//  Copyright (c) 2013 Scott Petit. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface DRBLShot : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSString *identifier;
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, assign, readonly) CGFloat width;
@property (nonatomic, assign, readonly) CGFloat height;
@property (nonatomic, strong, readonly) NSURL *shortURL;
@property (nonatomic, strong, readonly) NSURL *imageURL;
@property (nonatomic, strong, readonly) NSURL *imageTeaserURL;
@property (nonatomic, strong, readonly) NSURL *image400URL;

@end
