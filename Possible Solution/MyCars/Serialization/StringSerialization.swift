//
//  StringSerialization.swift
//  MyCars
//


import Foundation


final class StringSerialization {
    class func stringForKey(key: String) -> String? {
        return NSUserDefaults.standardUserDefaults().stringForKey(key)
    }
    
    class func saveStringForKey(value: String?, key: String) {
        NSUserDefaults.standardUserDefaults().setObject(value, forKey: key)
    }
}
