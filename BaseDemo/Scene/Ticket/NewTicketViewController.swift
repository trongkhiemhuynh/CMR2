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
    private var selectedIdx : IndexPath?
    private var vCal : CalendarView?
    private var dictData : NSMutableDictionary = NSMutableDictionary()
    private var cellDateSelected: TicketDetailInputInfoCollectionViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func setupView() {

        cvNewTicket.layer.backgroundColor = Color.BackgroundListColor().cgColor
        
        cvNewTicket.registerCell(TicketDetailInputInfoCollectionViewCell.self)
        
        cvNewTicket.registerCell(NewTicketCheckboxCollectionViewCell.self)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_ :)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_ :)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        cvNewTicket.addTapDismissKeyboard()
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        //FIXME
//        let cell = cvNewTicket.visibleCells[cvNewTicket.visibleCells.count - 3]
//
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//
//            let heightFromCell2Top = cell.frame.origin.y - cvNewTicket.contentOffset.y
//            let heightFromKeyboard2Top = heightScreen - keyboardSize.size.height
//
//            if heightFromCell2Top > heightFromKeyboard2Top {
//                // adjust content offset
//                var contentOffset = self.cvNewTicket.contentOffset
//
//                contentOffset.y = heightFromCell2Top - heightFromKeyboard2Top + 10
//
//                cvNewTicket.setContentOffset(contentOffset, animated: true)
//
//                UIView.animate(withDuration: 0.35) {
//                    self.cvNewTicket.layoutIfNeeded()
//                    self.view.layoutIfNeeded()
//                }
//            } else {
//                // do nothing
//            }
//
////            self.cvNewTicket.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height + 10, right: 0)
//        }

    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {

        self.cvNewTicket.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        UIView.animate(withDuration: 0.35) {
            self.cvNewTicket.layoutIfNeeded()
            self.view.layoutIfNeeded()
        }
    }
    
    func setTitleView(_ title: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            self.vTitle.lblTitle.text = title
        }
    }
    
    @IBAction func back() {
        didPopView()
    }
    
    @IBAction func save() {
        onSave()
    }
    
    func onSave() {
        //show qa
        let vSuccess = Bundle.main.loadNibNamed("PopupView", owner: self, options: nil)?[1] as! PopUpSuccessful
        
        self.view.addSubview(vSuccess)
        vSuccess.frame = self.view.bounds
        
        UIView.animate(withDuration: 0.35, delay: 0.0, options: .allowAnimatedContent, animations: {
            self.view.layoutIfNeeded()
        }) { (_) in
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1.0) {
            vSuccess.removeFromSuperview()
            self.didPopView()
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
            cellInput.onUpdate(image: UIImage(named: icName), title: titleName, detail: "")
            cellInput.delegate = self
            
            return cellInput
        }
    }
}

extension NewTicketViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIdx = indexPath
    }
}

extension NewTicketViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsetsDefault.left * (itemsPerRow + 1)
        let availableWidth = cvNewTicket.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: heightLargeCell)
    }
    
}

extension NewTicketViewController : FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        if let cell = cellDateSelected {
            let formatter = ApplicationManager.sharedInstance.VNDateFormatter
            let strDate = formatter.string(from: date)
            cell.tf.text = strDate
            vCal?.removeFromSuperview()
//            print("selected date : ",strDate)
        }
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        let strDate = ApplicationManager.sharedInstance.globalDateFormatter.string(from: date)
        
//        print("deselected date : ",date)
    }
}

extension NewTicketViewController : XibInitalization {
    typealias Element = NewTicketViewController
}

extension NewTicketViewController : TicketDetailInputInfoCollectionViewCellOutput {
    func onFrameCell(_ cell: UICollectionViewCell) {
        if let cell = cell as? TicketDetailInputInfoCollectionViewCell {
//            guard let cell = collectionView.cellForItem(at: indexPath) as? TicketDetailInputInfoCollectionViewCell else { return }
            cellDateSelected = cell
            
            if (cell.lbl.text?.lowercased().contains("date"))! {
                vCal = CalendarView.xibInstance()
                vCal?.fsCalendar.delegate = self
                view.addSubview(vCal!)
                vCal?.frame = view.bounds
            }
        }
    }
    
    func didEndEdit(titleField: String, inputField: String) {
        dictData.setValue(inputField, forKey: titleField)
    }
}

extension NewTicketViewController : NewTicketCheckboxCollectionViewCellOutput {
    func didEndEdit(titleField: String, inputField: Bool) {
        dictData.setValue(inputField, forKey: titleField)
    }
}

extension NewTicketViewController: BaseViewOutput {
    func didAddNew(type: String) {
        
    }
    
    func onPopView() {
        didPopView()
    }
}
