//
//  EventsWebView.swift
//  Crawick App
//
//  Created by Steven Gibson on 28/03/2018.
//  Copyright © 2018 Steven Gibson. All rights reserved.
//

import UIKit
import WebKit

class EventsWebView: UIViewController {

    
    
    @IBOutlet var webViewEvents: UIWebView!
    
    //@IBOutlet var webViewEvents: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlEvents = URL(string: "http://www.crawickmultiverse.co.uk/events/")!
        webViewEvents.loadRequest(URLRequest(url:urlEvents))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


   
}
