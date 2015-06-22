//
//  GasonObj.m
//  JSONlibs
//
//  Created by Loreto Parisi on 19/06/15.
//  Copyright (c) 2015 Mocha Code. All rights reserved.
//

#import "GasonObj.h"
#import "gason.h"
#import <string>
@implementation GasonObj

static void traverse(std::string k, JsonValue v) {
    switch (v.getTag()) {
        case JSON_ARRAY:
            for (auto i : v) {
                traverse(i->key,i->value);
            }
            break;
        case JSON_OBJECT:
            for (auto i : v) {
                traverse(i->key, i->value);
            }
            break;
        case JSON_STRING:
            printf("%s:%s\n", k.c_str(), v.toString() );
            break;
        case JSON_NUMBER:
            printf("%s:%f\n", k.c_str(), v.toNumber() );
            break;
        case JSON_TRUE:printf("%s:%f\n", k.c_str(), v.toNumber() );
            break;
        case JSON_FALSE:
            printf("%s:%f\n", k.c_str(), v.toNumber() );
            break;
        case JSON_NULL:
            break;
    }
}

- (id) parse:(NSString*)json {
    
    id result = nil;
    
    std::string str  = [json UTF8String];
    char *source = new char[str.size()+1];
    strcpy(source, str.c_str());
    
    //printf("JSON is %s\n", str.c_str());
    
    char *endptr;
    JsonValue value;
    JsonAllocator allocator;
    
    int status = jsonParse(source, &endptr, &value, allocator);
    if (status != JSON_OK) {
        fprintf(stderr, "%s at %zd\n", jsonStrError(status), endptr - source);
    } else {
        /*for (auto i : value) {
            printf("%s\n", i->key);
            //traverse(i->key, value);
        }*/
        result=[NSNumber numberWithBool:YES];
    }
    //free(source);
    return result;
}

@end
