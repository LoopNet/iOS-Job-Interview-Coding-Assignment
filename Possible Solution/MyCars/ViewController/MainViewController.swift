//
//  MainViewController.swift
//  MyCars
//


import UIKit


final class MainViewController: UIViewController, ListViewControllerDelegate {
    let kLastViewedCarsDrivenKey = "MyCars.LastViewedCarsDriven"
    let kLastViewedWishListKey = "MyCars.LastViewedWishList"
    
    @IBOutlet weak var carsDrivenLastViewedLabel: UILabel!
    @IBOutlet weak var wishListLastViewedLabel: UILabel!

    // MARK: Unwind
    @IBAction func unwindToMain(segue: UIStoryboardSegue) {}
    
    // MARK: Label Text
    private func lastViewedLabelTextForCarname(name: String?) -> String? {
        if let name = name {
            return "Last Viewed: \(name)"
        } else {
            return nil
        }
    }
    
    // MARK: <ListViewControllerDelegate>
    func itemViewed(listViewController: ListViewController, itemIndex: Int) {
        if let key = listViewController.key, cars = listViewController.cars {
            let  lastViewedName = cars[itemIndex].name
            StringSerialization.saveStringForKey(lastViewedName, key: key)
            if key == kLastViewedCarsDrivenKey {
                carsDrivenLastViewedLabel.text = lastViewedLabelTextForCarname(lastViewedName)
            }
            if key == kLastViewedWishListKey {
                wishListLastViewedLabel.text = lastViewedLabelTextForCarname(lastViewedName)
            }
        }
    }

    // MARK: View Life Cycle
    override func viewDidLoad() {
        func configureLabels() {
            carsDrivenLastViewedLabel.text = lastViewedLabelTextForCarname(StringSerialization.stringForKey(kLastViewedCarsDrivenKey))
            wishListLastViewedLabel.text = lastViewedLabelTextForCarname(StringSerialization.stringForKey(kLastViewedWishListKey))
        }
        
        super.viewDidLoad()
        configureLabels()
    }
    
    // MARK: Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var key: String?
        var filename: String?
        var title: String?
        
        if segue.identifier == "CarsDriven" {
            key = kLastViewedCarsDrivenKey
            filename = "CarsDriven"
            title = "Cars Driven"
        }
        if segue.identifier == "WishList" {
            key = kLastViewedWishListKey
            filename = "WishList"
            title = "Wish List"
        }
        
        if let key = key, filename = filename, title = title, listViewController = (segue.destinationViewController as! UINavigationController).topViewController as? ListViewController {
            listViewController.delegate = self
            listViewController.key = key
            listViewController.filename = filename
            listViewController.cars = CarsListSerialization.carsFromFileWithName(filename)
            listViewController.title = title
        }
    }
}

