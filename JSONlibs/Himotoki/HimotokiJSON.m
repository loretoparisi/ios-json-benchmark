//
//  HimotokiJSON.m
//  JSONlibs
//
//  Created by Loreto Parisi on 19/01/16.
//  Copyright © 2016 Mocha Code. All rights reserved.
//

#import "HimotokiJSON.h"
#import "JSONlibs-Swift.h"

@implementation HimotokiJSON

- (id) parse:(NSString*)json {
    HimotokiNWrapper *hmtk = [HimotokiNWrapper new];
    return [hmtk parse:json];
}

@end
