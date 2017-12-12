//
//  TextFileViewController.swift
//  LocalStorege_cw20
//
//  Created by Sergey Intern  on 12/11/17.
//  Copyright © 2017 Sergey Intern . All rights reserved.
//

import UIKit

class TextFileViewController: UIViewController {

    
    @IBOutlet private weak var ibFilenameTextField: UITextField!
    @IBOutlet private weak var ibContentTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction private func savePressed(_ sender: UIButton) {
        hideKeyboard()
        guard let fileName = ibFilenameTextField.text, !fileName.isEmpty else {
            showArertController(title: "Error", massage: "Cannot save file")
            return
        }
        let content = ibContentTextField.text ?? ""
        createFile(withName: fileName, content: content)
        showArertController(title: "File saved", massage: "")
    }
    
    @IBAction private func loadPressed(_ sender: UIButton) {
        guard let fileName = ibFilenameTextField.text, !fileName.isEmpty else {
            showArertController(title: "Error", massage: "File have not loaded")
            return
        }
        loadFile(withName: fileName)
        showArertController(title: "Success", massage: "")
    }
    
    // MARK: - Private
    private func createFile(withName name: String, content: String) {
        
        let fileUrl = Utils.pathInDocument(withComponent: name)
        
        do {
        try content.write(to: fileUrl, atomically: true, encoding: .utf8)
        } catch {
            debugPrint("Content do not write")
        }
    }
    
    private func loadFile(withName name: String) {
        
        let urlPath = Utils.pathInDocument(withComponent: name)
        do {
            let contents = try String(contentsOf: urlPath)
            ibContentTextField.text = contents
        } catch {
            showArertController(title: "Error", massage: "Wront file path")
        }
    }
    
    private func showArertController(title: String, massage: String) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
}
