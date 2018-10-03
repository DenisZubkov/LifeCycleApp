//
//  ViewController.swift
//  LifeCycleApp
//
//  Created by Denis Zubkov on 03/10/2018.
//  Copyright © 2018 Denis Zubkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logTextView: UITextView!
    var labelCreated = false
    var eventLog = UserDefaults.standard.value(forKey: "EventLog") as? String ?? ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logTextView.isEditable = false
        logTextView.isSelectable = false
        logTextView.text = ""
        labelCreated = true
    }

    func updateLog(method: String) {
        eventLog = "\(eventLog) \(method)\n"
        UserDefaults.standard.set(eventLog, forKey: "EventLog")
        if labelCreated {
            logTextView.text = eventLog
            let range = NSMakeRange(logTextView.text.count - 1, 1);
            logTextView.scrollRangeToVisible(range)
        }
    }
}

