//
//  ViewController.swift
//  NewsReader
//
//  Created by Michael Kan on 2/19/25.
//

import UIKit

class NewsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed
        
        if let apiKey = ProcessInfo.processInfo.environment["NEWS_API_KEY"], !apiKey.isEmpty {
            print("✅ API Key Loaded: \(apiKey)")
        } else {
            print("❌ API Key is missing")
        }
    }


}


