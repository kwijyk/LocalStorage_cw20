//
//  FileListViewController.swift
//  LocalStorege_cw20
//
//  Created by Sergey Intern  on 12/11/17.
//  Copyright © 2017 Sergey Intern . All rights reserved.
//

import UIKit

class FileListViewController: UIViewController {

    
    @IBOutlet private weak var ibTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let directoryUrl = Utils.directoryPath
        let allContents = try? FileManager.default.contentsOfDirectory(at: directoryUrl, includingPropertiesForKeys: nil, options: [])
        
        var resultString = ""
        for item in allContents! {
            resultString += item.lastPathComponent + "\n"
        }
        ibTextView.text = resultString
    }
}
