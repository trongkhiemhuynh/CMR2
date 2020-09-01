//
//  SplashViewController.swift
//  BaseDemo
//
//  Created by BASEBS on 8/5/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var lblsubWelcome : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let vc = UIAlertController(title: "test", message: "testt", preferredStyle: .actionSheet)
        present(vc, animated: true, completion: nil)
//        Timer.init(timeInterval: 3, repeats: false) { (timer) in
//            
//        }
        
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { (timer) in
            let vc = WelcomeViewController()
            self.present(vc, animated: false, completion: nil)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class TabBarController: UITabBarController {
    
//    var image: UIImageView?
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        image = UIImageView(image: createImage(color: UIColor(red:0.18, green:0.66, blue:0.24, alpha:1.0), size: tabBarItemSize, lineHeight: 4))
//        tabBar.addSubview(image!)
//    }
//    
//    func createImage(color: UIColor, size: CGSize, lineHeight: CGFloat) -> UIImage {
//        let rect: CGRect = CGRect(x: 0, y: size.height - lineHeight, width: size.width, height: lineHeight )
//        UIGraphicsBeginImageContextWithOptions(size, false, 0)
//        color.setFill()
//        UIRectFill(rect)
//        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
//        UIGraphicsEndImageContext()
//        return image
//    }
}
