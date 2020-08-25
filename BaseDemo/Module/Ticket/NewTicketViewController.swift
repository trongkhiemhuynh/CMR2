//
//  NewTicketViewController.swift
//  BaseDemo
//
//  Created by macOS on 8/25/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class NewTicketViewController: BaseViewController {

    @IBOutlet weak var vTitle : CustomTitleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func setupView() {
        vTitle.lblTitle.text = "Create new ticket"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func back() {
        self.navigationController?.popViewController(animated: false)
    }
    
    

}
