//
//  ListViewControllerDelegate.swift
//  MyCars
//


protocol ListViewControllerDelegate: class {
    func itemViewed(listViewController: ListViewController, itemIndex: Int)
}
