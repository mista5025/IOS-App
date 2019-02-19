//
//  UploadViewController.swift
//  ProjectA
//
//  Created by Lawrence Bang on 8/11/18.
//  Copyright © 2018 Lawrence Bang. All rights reserved.
//

import UIKit

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var travels = [Travel]()
    
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var pictureView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pictureView.layer.cornerRadius = pictureView.frame.height/2
        
    }

    @IBAction func addButton(_ sender: UIButton) {
        let name = nameTextField.text!;
        let address = addressTextField.text!;
        let description = descriptionTextField.text!;
        let image = pictureView.image
        let t = Travel(name: name, address: address, ds: description, pic: image!)
        travels.append(t);
        print("Added")
        let compressedData = NSKeyedArchiver.archivedData(withRootObject: travels)
        UserDefaults.standard.set(compressedData, forKey: "data")
        print("Saved")
    }
    
    @IBAction func uploadImage(_ sender: UITapGestureRecognizer) {
    let picker = UIImagePickerController()
        picker.sourceType = UIImagePickerController.SourceType.photoLibrary
        //if we use camera
        //picker.sourceType = UIImagePickerController.SourceType.camera
        picker.allowsEditing = false
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        pictureView.image = image
        dismiss(animated: true, completion: nil)
    }
}
