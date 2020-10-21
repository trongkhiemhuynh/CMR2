//
//  TabNavigationMenu.swift
//  BaseDemo
//
//  Created by khiemht on 8/24/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class TabNavigationMenu: UIView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    @IBOutlet weak var stackView : UIStackView!
    
    var itemTapped: ((_ tab: Int) -> Void)?
    var activeItem: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    convenience init(menuItems: [TabItem], frame: CGRect) {
        self.init(frame: frame)
        // Convenience init body
        self.layer.backgroundColor = UIColor.white.cgColor
        for i in 0 ..< menuItems.count {
            let itemWidth = self.frame.width / CGFloat(menuItems.count)
            let leadingAnchor = itemWidth * CGFloat(i)
            
            let itemView = self.createTabItem(item: menuItems[i])
            itemView.translatesAutoresizingMaskIntoConstraints = false
            itemView.clipsToBounds = true
            itemView.tag = i
        self.addSubview(itemView)
        NSLayoutConstraint.activate([
                itemView.heightAnchor.constraint(equalTo: self.heightAnchor),
                itemView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingAnchor),
                itemView.topAnchor.constraint(equalTo: self.topAnchor),
                itemView.widthAnchor.constraint(equalToConstant: itemWidth)
            ])
        }
        self.setNeedsLayout()
        self.layoutIfNeeded()
        self.activateTab(tab: 0) // activate the first tab
        
    }
    
    
    func createTabItem(item: TabItem) -> UIView {
        // ...
        
        // !!! FIX ME
        //        let tabBarItem = Bundle.main.loadNibNamed("TabbarItem", owner: self, options: nil)?.first as! TabbarItem//UIView(frame: CGRect.zero)
        //        print("----- frame ",tabBarItem.frame,#function)
        //
        //        tabBarItem.lblItem.text = item.displayTitle
        //        tabBarItem.lblItem.isHidden = true
        //        tabBarItem.imgItem.image = item.icon
        //
        //            let itemTitleLabel = UILabel(frame: CGRect.zero)
        //            let itemIconView = UIImageView(frame: CGRect.zero)
        //        itemTitleLabel.text = item.displayTitle
        //            itemTitleLabel.textAlignment = .center
        //            itemTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        //            itemTitleLabel.clipsToBounds = true
        //
        //            itemIconView.image = item.icon.withRenderingMode(.automatic)
        //            itemIconView.translatesAutoresizingMaskIntoConstraints = false
        //            itemIconView.clipsToBounds = true
        //        tabBarItem.layer.backgroundColor = UIColor.white.cgColor
        
        //            tabBarItem.addSubview(itemIconView)
        //            tabBarItem.addSubview(itemTitleLabel)
        //            tabBarItem.translatesAutoresizingMaskIntoConstraints = false
        //            tabBarItem.clipsToBounds = true
        //        NSLayoutConstraint.activate([
        //                itemIconView.heightAnchor.constraint(equalToConstant: 25), // Fixed height for our tab item(25pts)
        //                itemIconView.widthAnchor.constraint(equalToConstant: 25), // Fixed width for our tab item icon
        //                itemIconView.centerXAnchor.constraint(equalTo: tabBarItem.centerXAnchor),
        //                itemIconView.topAnchor.constraint(equalTo: tabBarItem.topAnchor, constant: 8), // Position menu item icon 8pts from the top of it's parent view
        //                itemIconView.leadingAnchor.constraint(equalTo: tabBarItem.leadingAnchor, constant: 35),
        //                itemTitleLabel.heightAnchor.constraint(equalToConstant: 13), // Fixed height for title label
        //                itemTitleLabel.widthAnchor.constraint(equalTo: tabBarItem.widthAnchor), // Position label full width across tab bar item
        //                itemTitleLabel.topAnchor.constraint(equalTo: itemIconView.bottomAnchor, constant: 4), // Position title label 4pts below item icon
        //            ])
        //        tabBarItem.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap))) // Each item should be able to trigger and action on tap
        //        return tabBarItem
        
        let tabBarItem = UIView(frame: CGRect.zero)
        let itemTitleLabel = UILabel(frame: CGRect.zero)
        let itemIconView = UIImageView(frame: CGRect.zero)
        itemTitleLabel.text = item.displayTitle
        itemTitleLabel.textAlignment = .center
        itemTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        itemTitleLabel.clipsToBounds = true
        itemTitleLabel.isHidden = true
        itemTitleLabel.font = UIFont.systemFont(ofSize: 14)
        
//        itemIconView.image = item.icon
        itemIconView.contentMode = .scaleAspectFill
        itemIconView.translatesAutoresizingMaskIntoConstraints = false
        itemIconView.clipsToBounds = true
        
        tabBarItem.layer.backgroundColor = UIColor.white.cgColor
        tabBarItem.addSubview(itemIconView)
        tabBarItem.addSubview(itemTitleLabel)
        tabBarItem.translatesAutoresizingMaskIntoConstraints = false
        tabBarItem.clipsToBounds = true
//        tabBarItem.backgroundColor = .red
        
        NSLayoutConstraint.activate([
            itemIconView.heightAnchor.constraint(equalToConstant: 20), // Fixed height for our tab item(25pts)
            itemIconView.widthAnchor.constraint(equalToConstant: 20), // Fixed width for our tab item icon
            itemIconView.centerXAnchor.constraint(equalTo: tabBarItem.centerXAnchor),
            itemIconView.centerYAnchor.constraint(equalTo: tabBarItem.centerYAnchor),
//            itemIconView.topAnchor.constraint(equalTo: tabBarItem.topAnchor, constant: 8), // Position menu item icon 8pts from the top of it's parent view
//            itemIconView.leadingAnchor.constraint(equalTo: tabBarItem.leadingAnchor, constant: 35),
            
            itemTitleLabel.centerYAnchor.constraint(equalTo: tabBarItem.centerYAnchor), // Fixed height for title label
//            itemTitleLabel.widthAnchor.constraint(equalToConstant: 70.0), // Position label full width across tab bar item
            itemTitleLabel.leftAnchor.constraint(equalTo: itemIconView.rightAnchor, constant: 4), // Position title label 4pts below item icon
        ])
        
        tabBarItem.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap))) // Each item should be able to trigger and action on tap
        
        return tabBarItem
    }
    
    @objc func handleTap(_ sender: UIGestureRecognizer) {
        // ...
        self.switchTab(from: self.activeItem, to: sender.view!.tag)
    }
    
    
    func switchTab(from: Int, to: Int) {
        // ...
        self.deactivateTab(tab: from)
        self.activateTab(tab: to)
    }
    func activateTab(tab: Int) {
        // ...
        let tabToActivate = self.subviews[tab]
        let lblItem = tabToActivate.subviews.last as! UILabel
        let iconItem = tabToActivate.subviews.first as! UIImageView
        lblItem.isHidden = false

        iconItem.centerXAnchor.constraint(equalTo: tabToActivate.centerXAnchor, constant: -40).isActive = true
        
        let borderWidth = tabToActivate.frame.size.width - 20
        let borderLayer = CALayer()
        borderLayer.backgroundColor = UIColor.green.cgColor
        borderLayer.name = "active border"
        borderLayer.frame = CGRect(x: 10, y: 0, width: borderWidth, height: 2)
//        DispatchQueue.main.async {
//            UIView.animate(withDuration: 0.8, delay: 0.0, options: [.curveEaseIn, .allowUserInteraction], animations: {
//                tabToActivate.layer.addSublayer(borderLayer)
//                tabToActivate.setNeedsLayout()
//                tabToActivate.layoutIfNeeded()
//            })
//            self.itemTapped?(tab)
//        }
        
        tabToActivate.setNeedsLayout()
        tabToActivate.layoutIfNeeded()
        self.activeItem = tab
        self.itemTapped?(tab)
    }
    func deactivateTab(tab: Int) {
        // ...
        let inactiveTab = self.subviews[tab]
        let lblItem = inactiveTab.subviews.last as! UILabel
        let iconItem = inactiveTab.subviews.first as! UIImageView
        lblItem.isHidden = true

        iconItem.centerXAnchor.constraint(equalTo: inactiveTab.centerXAnchor).isActive = true
        inactiveTab.setNeedsLayout()
        inactiveTab.layoutIfNeeded()
//        let layersToRemove = inactiveTab.layer.sublayers!.filter({ $0.name == "active border" })
//        DispatchQueue.main.async {
//            UIView.animate(withDuration: 0.4, delay: 0.0, options: [.curveEaseIn, .allowUserInteraction], animations: {
//                layersToRemove.forEach({ $0.removeFromSuperlayer() })
//                inactiveTab.setNeedsLayout()
//                inactiveTab.layoutIfNeeded()
//            })
//        }
    }
    
}
