//
//  EscalatedViewController.swift
//  BaseDemo
//
//  Created by BASEBS on 8/19/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit


class TicketDetailActivityViewController: BaseViewController {

    let reuseId = "TDAID"
    private let sectionInsets = UIEdgeInsets(top: 10.0,
                                             left: 10.0,
                                             bottom: 10.0,
                                             right: 10.0)
    private let itemsPerRow: CGFloat = 1
    private let heightCell : CGFloat = 142
    
    @IBOutlet weak var lblActivity : UILabel!
    @IBOutlet weak var vActivity : UIView!
    @IBOutlet weak var cvActivity : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func setupView() {
        view.backgroundColor = BASEColor.BackgroundListColor()
        cvActivity.backgroundColor = BASEColor.BackgroundListColor()
        
        cvActivity.register(UINib(nibName: "TicketDetailActivityCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseId)
        
        vActivity.layer.cornerRadius = 8
        
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

extension TicketDetailActivityViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = cvActivity.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: heightCell)
    }
    
    
}

extension TicketDetailActivityViewController : UICollectionViewDelegate {
    
}

extension TicketDetailActivityViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as! TicketDetailActivityCollectionViewCell
        
        
        return cell
    }
    
    
}
