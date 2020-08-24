//
//  NavigationMenuBaseController.swift
//  BaseDemo
//
//  Created by khiemht on 8/24/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

class NavigationMenuBaseController: UITabBarController {
    
    var customTabBar: TabNavigationMenu!
    var tabBarHeight: CGFloat = 67.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadTabBar()
        // Do any additional setup after loading the view.
    }
    
    func loadTabBar() {
        // We'll create and load our custom tab bar here
        let tabItems: [TabItem] = [.dashboard, .profile, .ticket, .more]
        
        self.setupCustomTabMenu(tabItems) { (controllers) in
            self.viewControllers = controllers
        }
        
        self.selectedIndex = 0 // default our selected index to the first item
        
    }
    
    func setupCustomTabMenu(_ menuItems: [TabItem], completion: @escaping ([UIViewController]) -> Void) {
        // handle creation of the tab bar and attach touch event listeners
        
        
        let frame = tabBar.frame
        var controllers = [UIViewController]()
        // hide the tab bar
        tabBar.isHidden = true
        
        let customTabbar = Bundle.main.loadNibNamed("TabNavigationMenu", owner: self, options: nil)?.first as! TabNavigationMenu
        customTabbar.frame = frame
        
        for i in 0 ..< menuItems.count {
            let itemView = customTabbar.createTabItem(item: menuItems[i]) as! TabbarItem
            
            customTabbar.stackView.addArrangedSubview(itemView)
            
//            itemView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        }
        
        
        customTabbar.activateTab(tab: 0)
        self.customTabBar = customTabbar//TabNavigationMenu(menuItems: menuItems, frame: frame)
//        self.customTabBar.translatesAutoresizingMaskIntoConstraints = false
//        self.customTabBar.clipsToBounds = true
        self.customTabBar.itemTapped = self.changeTab
        
        // Add it to the view
        self.view.addSubview(customTabBar)
        // Add positioning constraints to place the nav menu right where the tab bar should be
//        NSLayoutConstraint.activate([
//            self.customTabBar.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
//            self.customTabBar.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
//            self.customTabBar.widthAnchor.constraint(equalToConstant: tabBar.frame.width),
//            self.customTabBar.heightAnchor.constraint(equalToConstant: tabBarHeight), // Fixed height for nav menu
//            self.customTabBar.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor)
//        ])
        for i in 0 ..< menuItems.count {
            controllers.append(menuItems[i].viewController) // we fetch the matching view controller and append here
        }
//        self.view.layoutIfNeeded() // important step
        completion(controllers) // setup complete. handoff here
    }
    
    @objc func handleTap() {
        print(#function)
    }
    
    func changeTab(tab: Int) {
        self.selectedIndex = tab
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("------",tabBar.selectedItem,item.title, #function)
        
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
