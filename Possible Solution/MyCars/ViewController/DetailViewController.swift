//
//  DetailViewController.swift
//  MyCars
//


import UIKit


final class DetailViewController: UIViewController {
    var car: Car?

    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        func configure() {
            if let car = car {
                title = car.name
                let request = NSURLRequest(URL: car.url)
                webView.loadRequest(request)
            }
        }
        
        super.viewDidLoad()
        configure()
    }
}
