//
//  ImageViewController.swift
//  LocalStorege_cw20
//
//  Created by Sergey Intern  on 12/11/17.
//  Copyright © 2017 Sergey Intern . All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    
    
    @IBOutlet private weak var ibImageView: UIImageView!
    
    private let defaultImageName = "defaultImageName.png"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadImage(withName: defaultImageName)
    }

    // MARK: - Private methods
    private func saveImage(withName name: String) {
        let imageUrl = Utils.pathInDocument(withComponent: name)
        guard let image = ibImageView.image else { return }
        let imageData = UIImagePNGRepresentation(image)
        FileManager.default.createFile(atPath: imageUrl.path, contents: imageData, attributes: nil)
    }
    
    private func loadImage(withName name: String) {
        let imageUrl = Utils.pathInDocument(withComponent: name)
        
        if FileManager.default.fileExists(atPath: imageUrl.path) {
            let image = UIImage(contentsOfFile: imageUrl.path)
            ibImageView.image = image
        } else {
            debugPrint("File doesn't exists")
            ibImageView.image = nil
        }
    }
    
    private func showGalleryScreen() {
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.sourceType = .photoLibrary
        imagePickerVC.delegate = self
        present(imagePickerVC, animated: true, completion: nil)
    }
    
    
    // MARK: - Actions
    @IBAction private func loadPressed(_ sender: UIButton) {
        loadImage(withName: defaultImageName)
    }
    
    @IBAction private func changePressed(_ sender: UIButton) {
        showGalleryScreen()
    }
    
    @IBAction private func savePressed(_ sender: UIButton) {
        saveImage(withName: defaultImageName)
    }
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension ImageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        ibImageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
}
