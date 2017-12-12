//
//  GreetingViewController.swift
//  LocalStorege_cw20
//
//  Created by Sergey Intern  on 12/11/17.
//  Copyright © 2017 Sergey Intern . All rights reserved.
//

import UIKit

class GreetingViewController: UIViewController {

    @IBOutlet private weak var ibLastVisitLabel: UILabel!
    @IBOutlet private weak var ibGreetingLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let lastVisitDate = DataManager.instance.lastAppVisitDate {
            ibLastVisitLabel.text = "Last visit" + String(describing: lastVisitDate)
            ibGreetingLabel.text = "Welcome back"
        } else {
            ibLastVisitLabel.text =  ""
            ibGreetingLabel.text = "HELLO"
        }
        
        DataManager.instance.lastAppVisitDate = Date()
    }

 
    @IBAction private func nextPressedAction(_ sender: UIButton) {
        
        let identifier = DataManager.instance.isTutorialCompletedStorageKey ?  "showMainScreen" : "showTutorialScreen"
        performSegue(withIdentifier: identifier, sender: nil)
    }
}
