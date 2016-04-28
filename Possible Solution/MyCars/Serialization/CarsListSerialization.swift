//
//  CarsListSerialization.swift
//  MyCars
//


import Foundation


final class CarsListSerialization {
    // MARK: Converting PList to Typed Array
    class func carsFromFileWithName(name: String) -> [Car] {
        var cars: [Car] = []
        if let path = NSBundle.mainBundle().pathForResource(name, ofType: "plist"), plistArray = NSArray(contentsOfFile: path) {
            for index in 0..<plistArray.count {
                let carAsDictionary = plistArray[index] as! [String: AnyObject]
                if let car = Car(dictionary: carAsDictionary) {
                    cars.append(car)
                }
            }
        }
        return cars
    }
}
