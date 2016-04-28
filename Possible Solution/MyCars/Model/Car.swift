//
//  Car.swift
//  MyCars
//


import Foundation


final class Car: CustomDebugStringConvertible {
    let name: String
    let url: NSURL
    let owner: String?
    let location: String?
    
    // MARK: Initializers
    init(name: String, url: NSURL, owner: String? = nil, location: String? = nil) {
        self.name = name
        self.url = url
        self.owner = owner
        self.location = location
    }
    
    convenience init?(name: String, urlAsString: String, owner: String? = nil, location: String? = nil) {
        if let url = NSURL(string: urlAsString) {
            self.init(name: name, url: url, owner: owner, location: location)
        } else {
            return nil
        }
    }
    
    convenience init?(dictionary: [String: AnyObject]) {
        let name = dictionary["Name"] as! String?
        let urlAsString = dictionary["URL"] as! String?
        if let name = name, urlAsString = urlAsString {
            self.init(name: name, urlAsString: urlAsString, owner: dictionary["Owner"] as! String?, location: dictionary["Location"] as! String?)
        } else {
            return nil
        }
    }
    
    // MARK: <CustomDebugStringConvertible>
    var debugDescription : String {
        var ownerAsString = "nil"
        if let owner = owner {
            ownerAsString = "'\(owner)'"
        }
        var locationInAsString = "nil"
        if let location = location {
            locationInAsString = "'\(location)'"
        }
        return "Car: Name: \(name), URL: \(url) Owner: \(ownerAsString) Location: \(locationInAsString)"
    }
}
