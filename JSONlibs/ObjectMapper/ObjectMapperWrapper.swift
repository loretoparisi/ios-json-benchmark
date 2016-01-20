//
//  ObjectMapperJSON.swift
//  JSONlibs
//
//  Created by Loreto Parisi on 20/01/16.
//  Copyright © 2016 Mocha Code. All rights reserved.
//

import Foundation

@objc public class ObjectMapperWrapper : NSObject {
    override init() {
    }
    public func parse(let aString:String!) -> AnyObject? {
        
        let mapper = Mapper<BasicTypes>()
        let value: String = aString
        let object = BasicTypes()
        object.string = value
        object.stringOptional = value
        object.stringImplicityUnwrapped = value
        
        let JSONString = Mapper().toJSONString(object, prettyPrint: true)
        return mapper.map(JSONString!)
    }
}

