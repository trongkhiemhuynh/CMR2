//
//  NewTicketViewController.swift
//  BaseDemo
//
//  Created by macOS on 8/25/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
import FSCalendar

class NewTicketViewController: BaseViewController {
    
    @IBOutlet weak var cvNewTicket : UICollectionView!
    
    // variable
    private let itemsPerRow: CGFloat = 1
    private let heightCellInfoDetail : CGFloat = 70
    private var selectedIdx : IndexPath?
    private var vCal : CalendarView?
    private var dictData : NSMutableDictionary = NSMutableDictionary()
    
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
    
    @IBAction func back() {
        didPop()
    }
    
    @IBAction func save() {
        if let vConfirm = Bundle.main.loadNibNamed("PopupView", owner: self, options: nil)?.last as? PopUpConfirm {
            self.view.addSubview(vConfirm)
            vConfirm.frame = self.view.bounds
        }
        
        UIView.animate(withDuration: 0.35, delay: 0.0, options: .allowAnimatedContent, animations: {
            self.view.layoutIfNeeded()
        }) { (ok) in
            Logger.debug(self.dictData)
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
            cell?.delegate = self
            
            return cell!
        } else {
            let cellInput = collectionView.dequeueReusableCell(withReuseIdentifier: TicketDetailInputInfoCollectionViewCell.identifier, for: indexPath) as! TicketDetailInputInfoCollectionViewCell
            cellInput.reloadData(UIImage(named: icName), titleName, "")
            cellInput.delegate = self
            
            return cellInput
        }
    }
}

extension NewTicketViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedIdx = indexPath
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? TicketDetailInputInfoCollectionViewCell else { return }
        
        if (cell.lbl.text?.lowercased().contains("date"))! {
            vCal = CalendarView.xibInstance()
            vCal?.fsCalendar.delegate = self
            view.addSubview(vCal!)
            vCal?.frame = view.bounds
        }
        
    }
}

extension NewTicketViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsetsDefault.left * (itemsPerRow + 1)
        let availableWidth = cvNewTicket.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: heightCellInfoDetail)
    }
    
}

extension NewTicketViewController : FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        let formatter = ApplicationManager.sharedInstance.globalDateFormatter
        let strDate = formatter.string(from: date)
        
        let cell = cvNewTicket.cellForItem(at: selectedIdx!) as? TicketDetailInputInfoCollectionViewCell
        cell?.tf.text = strDate
        vCal?.removeFromSuperview()
        print("selected date : ",strDate)
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let strDate = ApplicationManager.sharedInstance.globalDateFormatter.string(from: date)
        
        print("deselected date : ",strDate)
    }
}

extension NewTicketViewController : XibInitalization {
    typealias Element = NewTicketViewController
}

extension NewTicketViewController : TicketDetailInputInfoCollectionViewCellOutput {
    func didEndEdit(titleField: String, inputField: String) {
        dictData.setValue(inputField, forKey: titleField)
    }
}

extension NewTicketViewController : NewTicketCheckboxCollectionViewCellOutput {
    func didEndEdit(titleField: String, inputField: Bool) {
        dictData.setValue(inputField, forKey: titleField)
    }
}
