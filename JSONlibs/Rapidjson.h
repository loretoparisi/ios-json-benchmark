//
//  Rapidjson.h
//  JSONlibs
//
//  Created by Loreto Parisi on 19/06/15.
//  Copyright (c) 2015 Mocha Code. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^RapidjsonCallback)(id result, NSError *error);

@interface Rapidjson : NSObject

- (void) parse:(NSString*)json callback:(RapidjsonCallback)callback;
- (id) parse:(NSString*)json;

@end
