 //
//  TutorialViewController.swift
//  LocalStorege_cw20
//
//  Created by Sergey Intern  on 12/11/17.
//  Copyright © 2017 Sergey Intern . All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          guard segue.identifier == "showMainScreen" else { return }
        DataManager.instance.isTutorialCompletedStorageKey = true
    }
}
