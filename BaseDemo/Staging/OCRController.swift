//
//  OCRController.swift
//  BaseDemo
//
//  Created by macOS on 9/14/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
//import TesseractOCR
//import MobileCoreServices

class OCRController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        if let tesseract = G8Tesseract(language: "vn") {
//          // 2
//          tesseract.engineMode = .tesseractCubeCombined
//          // 3
//          tesseract.pageSegmentationMode = .auto
//          // 4
//          tesseract.image = UIImage(named: "ocr_test")
//          // 5
//          tesseract.recognize()
//          // 6
//            Logger.debug(tesseract.recognizedText)
////            textView.text = tesseract.recognizedText
//        }
    }
    
    func alphaTest() {
        let p = PublishSubject<String>()
        let b = BehaviorSubject<String>(value: "htk")
//        let r = ReplaySubject<Any>()
        let br = BehaviorRelay<String>(value: "")
        
        p.onNext("kkk")
        p.asObservable().subscribe(onNext: { (element) in
            
        }, onError: { (error) in
            
        }, onCompleted: {
            
            }).disposed(by: DisposeBag())
    }
    
    func alphaTestRedux(){
        
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
