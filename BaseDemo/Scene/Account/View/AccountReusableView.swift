//
//  AccountReusableView.swift
//  BaseDemo
//
//  Created by macOS on 9/22/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

//protocol AccountReusableViewOutput {
//    func onChangeImage()
//}

class AccountReusableView: UICollectionReusableView {

    @IBOutlet weak var iv: UIImageView!
    
    var onChangeImg: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = Color.BackgroundListColor()
        iv.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onChangeImage)))
        iv.isUserInteractionEnabled = true
        iv.layer.cornerRadius = iv.frame.size.height/2
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let imgData = ApplicationManager.sharedInstance.getValueUserDefault(key: kAvatarImage) as? Data {
            iv.image = UIImage(data: imgData)
        }
    }
    
    @IBAction func onChangeImage() {
        print("present view")
        let imagePicker = UIImagePickerController()
        let topView = UIApplication.getTopViewController()
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            
            topView!.present(imagePicker, animated: true, completion: nil)
        }
    }
    
}

extension AccountReusableView: XibInitalization {
    typealias Element = AccountReusableView
}

extension AccountReusableView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        let topView = UIApplication.getTopViewController()
        topView!.dismiss(animated: true, completion: { () -> Void in
            
        })
        
        iv.image = image
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = info[.editedImage] as? UIImage
        iv.contentMode = .scaleAspectFit
        iv.image = image
        
        let imageData = image!.pngData()
        ApplicationManager.sharedInstance.saveUserDefault(value: imageData, key: kAvatarImage)
        picker.dismiss(animated: true, completion: nil)
    }
}
