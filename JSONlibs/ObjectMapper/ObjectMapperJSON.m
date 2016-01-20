//
//  ObjectMapperJSON.m
//  JSONlibs
//
//  Created by Loreto Parisi on 20/01/16.
//  Copyright © 2016 Mocha Code. All rights reserved.
//

#import "ObjectMapperJSON.h"
#import "JSONlibs-Swift.h"

@implementation ObjectMapperJSON
- (id) parse:(NSString*)json {
    ObjectMapperWrapper *hmtk = [ObjectMapperWrapper new];
    return [hmtk parse:json];
}
@end
