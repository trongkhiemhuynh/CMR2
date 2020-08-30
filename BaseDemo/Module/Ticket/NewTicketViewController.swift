//
//  NewTicketViewController.swift
//  BaseDemo
//
//  Created by macOS on 8/25/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class NewTicketViewController: BaseViewController {
    
    @IBOutlet weak var cvNewTicket : UICollectionView!
    
    // variable
    private let sectionInsets = UIEdgeInsets(top: 10.0,
                                             left: 10.0,
                                             bottom: 10.0,
                                             right: 10.0)
    private let itemsPerRow: CGFloat = 1
    private let heightCellInfoDetail : CGFloat = 70
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func setupView() {
        vTitle.lblTitle.text = "Create new ticket"
        cvNewTicket.layer.backgroundColor = BASEColor.BackgroundListColor()?.cgColor
        
        cvNewTicket.registerCell(TicketDetailInputInfoCollectionViewCell.self)
        
        cvNewTicket.registerCell(NewTicketCheckboxCollectionViewCell.self)
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
    
    @IBAction func save() {

        UIView.animate(withDuration: 0.35, delay: 0.0, options: .transitionFlipFromBottom, animations: {
            if let vConfirm = Bundle.main.loadNibNamed("PopupView", owner: self, options: nil)?.last as? PopUpConfirm {
                self.view.addSubview(vConfirm)
                vConfirm.frame = self.view.bounds
            }
            self.view.layoutIfNeeded()
        }) { (ok) in
            print(ok)
        }
    }
}

extension NewTicketViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrInputTicket.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let icName = arrIcTicket[indexPath.row]
        let titleName = arrInputTicket[indexPath.row]
        
        if titleName.contains("Escalated") || titleName.contains("Done") {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewTicketCheckboxCollectionViewCell.identifier, for: indexPath) as? NewTicketCheckboxCollectionViewCell

            cell?.lblTitle.text = titleName
            
            return cell!
        } else {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: TicketDetailInputInfoCollectionViewCell.identifier, for: indexPath) as! TicketDetailInputInfoCollectionViewCell
            cell2.reloadData(UIImage(named: icName), titleName, "")
            
            return cell2
        }
        
        
    }
}

extension NewTicketViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = cvNewTicket.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: heightCellInfoDetail)
    }
    
}

