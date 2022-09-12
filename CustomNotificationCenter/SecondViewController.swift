//
//  SecondViewController.swift
//  CustomNotificationCenter
//
//  Created by fyz on 7/13/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstLabel.text = "Waiting first notification"
        secondLabel.text = "Waiting second notification"
        
        CustomNotificationCenter.shared.addObserver(name: "firstNotification", queue: OperationQueue.main) { notification in
            if let userInfo = notification.userInfo {
                print("First notification received")
                self.firstLabel.text = userInfo["name"] as? String
            }
        }
        CustomNotificationCenter.shared.addObserver(name: "secondNotification", selector: #selector(secondReceived(_:)), object: self)
    }

    @objc func secondReceived(_ userInfo: [AnyHashable : Any]){
        print("Second notification received")
        self.secondLabel.text = userInfo["lastName"] as? String
        
    }
    

}
