//
//  Json11.m
//  JSONlibs
//
//  Created by Loreto Parisi on 13/10/15.
//  Copyright © 2015 Mocha Code. All rights reserved.
//

#import "JsonModernCPlusPlus.h"
#import "json.hpp"
#import "CppStringAdditions.h"

using json = nlohmann::json;

@implementation JsonModernCPlusPlus

- (NSString*)parse:(NSString*)json {
    
    const char* data = [json UTF8String];
    
    auto j3 = json::parse(data);

    std::string jsonString = j3.dump();
    
    //printf("%s", jsonString.c_str());
    
    return [NSString stringWithstring:jsonString];

}

@end
