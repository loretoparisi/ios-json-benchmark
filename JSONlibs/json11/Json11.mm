//
//  Json11.m
//  JSONlibs
//
//  Created by Loreto Parisi on 13/10/15.
//  Copyright © 2015 Mocha Code. All rights reserved.
//

#import "Json11.h"
#import "json11.hpp"
#include <iostream>

@interface NSString (cppstring_additions)
+(NSString*) stringWithwstring:(const std::wstring&)string;
+(NSString*) stringWithstring:(const std::string&)string;
-(std::wstring) getwstring;
-(std::string) getstring;
@end

@implementation NSString (cppstring_additions)

#if TARGET_RT_BIG_ENDIAN
const NSStringEncoding kEncoding_wchar_t = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingUTF32BE);
#else
const NSStringEncoding kEncoding_wchar_t = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingUTF32LE);
#endif

+(NSString*) stringWithwstring:(const std::wstring&)ws
{
    char* data = (char*)ws.data();
    unsigned size = ws.size() * sizeof(wchar_t);
    
    NSString* result = [[NSString alloc] initWithBytes:data length:size encoding:kEncoding_wchar_t];
    return result;
}
+(NSString*) stringWithstring:(const std::string&)s
{
    NSString* result = [[NSString alloc] initWithUTF8String:s.c_str()];
    return result;
}

-(std::wstring) getwstring
{
    NSData* asData = [self dataUsingEncoding:kEncoding_wchar_t];
    return std::wstring((wchar_t*)[asData bytes], [asData length] / sizeof(wchar_t));
}
-(std::string) getstring
{
    return [self UTF8String];
}

@end

@implementation Json11

- (NSString*)parse:(NSString*)json {
    
    const char* data = [json UTF8String];
    
    json11::Json parser;
    
    parser = json11::Json(data);
    
    std::string jsonString;
    
    parser.dump(jsonString);

    
    printf("%s", jsonString.c_str());
    
    return [NSString stringWithstring:jsonString];

}

@end
