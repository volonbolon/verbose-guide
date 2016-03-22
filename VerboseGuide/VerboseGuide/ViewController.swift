//
//  ViewController.swift
//  VerboseGuide
//
//  Created by Ariel Rodriguez on 3/21/16.
//  Copyright © 2016 Ariel Rodriguez. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    @IBOutlet weak var tokenLabel: UILabel!
    var notificationObserver:AnyObject?
    var shouldShowLogin = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.notificationObserver = NSNotificationCenter.defaultCenter().addObserverForName(Constants.NotificationName.TokenUpdated, object: nil, queue: NSOperationQueue.mainQueue(), usingBlock: { (notification:NSNotification) -> Void in
            let userInfo = notification.userInfo!
            let token = userInfo[Constants.NotificationUserInfoKey.Token]
            self.tokenLabel.text = (token as! String)
            self.dismissViewControllerAnimated(true, completion: nil)
        })
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if self.shouldShowLogin == true {
            self.shouldShowLogin = false
            let url = NSURL(string: "https://rawgit.com/volonbolon/3bd9e3c43e60c30992ee/raw/57de598f3197ba639607d312c8e0e8b810af63e0/login.html")
            
            let svc = SFSafariViewController(URL: url!)
            self.presentViewController(svc, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

