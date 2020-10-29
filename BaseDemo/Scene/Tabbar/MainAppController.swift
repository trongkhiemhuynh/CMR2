//
//  NavigationMenuBaseController.swift
//  BaseDemo
//
//  Created by khiemht on 8/24/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit
import SideMenu

class MainAppController: UITabBarController {

    public var customTabbar: CustomTabBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadTabBar()
        // Do any additional setup after loading the view.
    }
    
    func loadTabBar() {
        // We'll create and load our custom tab bar here
        var controllers = [UIViewController]()
        
        tabBar.isHidden = true
        
        self.selectedIndex = 0
        
        customTabbar = CustomTabBarView.xibInstance()
        self.view.addSubview(customTabbar!)
        customTabbar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            customTabbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customTabbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customTabbar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            customTabbar.heightAnchor.constraint(equalToConstant: heightTabbar)
        ])
        
        customTabbar?.itemTapped = changeTab(tab:)

        TabItem.allCases.forEach {
            controllers.append($0.viewController)
        }
        
        self.viewControllers = controllers
    }
    
//    func setupCustomTabMenu(_ items : [TabItem], completion: @escaping ([UIViewController]) -> Void) {
//
//        let frame = tabBar.frame
//        var controllers = [UIViewController]()
//        // hide the tab bar
//        tabBar.isHidden = true
//        self.customTabBar = TabNavigationMenu(menuItems: items, frame: frame)
//        self.customTabBar.translatesAutoresizingMaskIntoConstraints = false
//        self.customTabBar.clipsToBounds = true
//        self.customTabBar.itemTapped = self.changeTab
//        // Add it to the view
//        self.view.addSubview(customTabBar)
//        // Add positioning constraints to place the nav menu right where the tab bar should be
//        NSLayoutConstraint.activate([
//            self.customTabBar.leadingAnchor.constraint(equalTo: tabBar.leadingAnchor),
//            self.customTabBar.trailingAnchor.constraint(equalTo: tabBar.trailingAnchor),
//            self.customTabBar.widthAnchor.constraint(equalToConstant: tabBar.frame.width),
//            self.customTabBar.heightAnchor.constraint(equalToConstant: tabBarHeight), // Fixed height for nav menu
//            self.customTabBar.bottomAnchor.constraint(equalTo: tabBar.bottomAnchor)
//        ])
//        for i in 0 ..< items.count {
//            controllers.append(items[i].viewController) // we fetch the matching view controller and append here
//        }
//        self.view.layoutIfNeeded() // important step
//        completion(controllers) // setup complete. handoff here
//    }
    
    func changeTab(tab: Int) {
        if tab == 999 {
            //tapped the same tab
            let nav = self.viewControllers?[self.selectedIndex] as? UINavigationController
            nav?.popToRootViewController(animated: false)
        } else {
            self.selectedIndex = tab
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
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

extension MainAppController : XibInitalization {
    typealias Element = MainAppController
}
