//
//  Rapidjson.m
//  JSONlibs
//
//  Created by Loreto Parisi on 19/06/15.
//  Copyright (c) 2015 Mocha Code. All rights reserved.
//

#import "Rapidjson.h"

#include "rapidjson/document.h"
#include "rapidjson/writer.h"
#include "rapidjson/stringbuffer.h"
#include <iostream>


using namespace rapidjson;

@implementation Rapidjson

- (void) parse:(NSString*)json callback:(RapidjsonCallback)callback {
    
    NSMutableDictionary *result = [[NSMutableDictionary alloc] init];
    
    const char* data = [json UTF8String];
    
    Document d;
    d.Parse(data);
    
    // Iterating object members
    static const char* kTypeNames[] = { "Null", "False", "True", "Object", "Array", "String", "Number" };
    for (Value::ConstMemberIterator itr = d.MemberBegin(); itr != d.MemberEnd(); ++itr) {
        printf("Type of member %s is %s\n", itr->name.GetString(), kTypeNames[itr->value.GetType()]);
        const Value& a = itr->value;
    }
    
    if (callback) callback(result,nil);
}

- (id) parse:(NSString*)json {
    
    NSMutableDictionary *result = [[NSMutableDictionary alloc] init];
    const char* data = [json UTF8String];
    
    Document d;
    d.Parse(data);
    
    /*static const char* kTypeNames[] = { "Null", "False", "True", "Object", "Array", "String", "Number" };
    for (Value::ConstMemberIterator itr = d.MemberBegin(); itr != d.MemberEnd(); ++itr) {
        printf("Type of member %s is %s\n", itr->name.GetString(), kTypeNames[itr->value.GetType()]);
        const Value& a = itr->value;
    }*/
    
    return result;
}

- (void) test {
    // 1. Parse a JSON string into DOM.
    const char* json = "{\"project\":\"rapidjson\",\"stars\":10}";
    Document d;
    d.Parse(json);
    
    // 2. Modify it by DOM.
    Value& s = d["stars"];
    s.SetInt(s.GetInt() + 1);
    
    // 3. Stringify the DOM
    StringBuffer buffer;
    Writer<StringBuffer> writer(buffer);
    d.Accept(writer);
    
    // Output {"project":"rapidjson","stars":11}
    std::cout << buffer.GetString() << std::endl;
}

@end
