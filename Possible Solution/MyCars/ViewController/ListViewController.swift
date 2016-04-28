//
//  ListViewController.swift
//  MyCars
//


import UIKit


final class ListViewController: UITableViewController {
    var key: String?
    var cars: [Car]?
    var filename: String?
    
    weak var delegate: ListViewControllerDelegate?

    // MARK: <UITableViewDelegate>
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let cars = cars {
            return cars.count
        } else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        func otherTextFromOwner(owner: String?, location: String?) -> String? {
            if let owner = owner {
                if let location = location {
                    return "\(owner), \(location)"
                } else {
                    return owner
                }
            } else {
                return location
            }
        }
        
        let carCell = tableView.dequeueReusableCellWithIdentifier("CarCell", forIndexPath: indexPath) as! CarTableViewCell
        let car = cars![indexPath.row]
        carCell.nameLabel.text = car.name
        carCell.otherLabel.text = otherTextFromOwner(car.owner, location: car.location)
        carCell.urlLabel.text = car.url.absoluteString // It turns out that labels with an italic font do not always render correctly, the right edge is cut off
        return carCell
    }

    // MARK: Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let detailViewController = segue.destinationViewController as? DetailViewController, index = tableView.indexPathForSelectedRow?.row, car = cars?[index] {
            detailViewController.car = car
            delegate?.itemViewed(self, itemIndex: index)
        }
    }
}
