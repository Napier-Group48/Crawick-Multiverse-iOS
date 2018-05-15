//
//  FirstViewController.swift
//  Crawick App
//
//  Created by Steven Gibson on 24/03/2018.
//  Copyright © 2018 Steven Gibson. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet var WebViewInfo: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let urlEvents = URL(string: "http://www.crawickmultiverse.co.uk/visitor-information/opening-times-and-prices/")!
        
        WebViewInfo.loadRequest(URLRequest(url:urlEvents))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

