//
//  ViewController.swift
//  CustomNotificationCenter
//
//  Created by fyz on 7/12/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func publishNotification(_ sender: Any) {
        CustomNotificationCenter.shared.post(name: "firstNotification", userInfo: ["name": "Feyza"])
        CustomNotificationCenter.shared.post(name: "secondNotification", userInfo: ["lastName": "Topgul"])
    }
    
    

    
}

