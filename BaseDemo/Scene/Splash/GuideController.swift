//
//  GuideControllerCollectionViewController.swift
//  BaseDemo
//
//  Created by khiemht on 9/27/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

let arrGuide = ["guide0","guide1","guide2","guide3"]

class GuideController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

//    var indexPathSelected: IndexPath?
    
    lazy var btnSkip: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = BASEColor.BackgroundExtendColor()
        btn.layer.cornerRadius = 15
        btn.setTitle("Skip", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(onSkip), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var btnPrevious: UIButton = {
       let previousBtn = UIButton()
        previousBtn.translatesAutoresizingMaskIntoConstraints = false
        previousBtn.backgroundColor = BASEColor.BackgroundExtendColor()
        previousBtn.layer.cornerRadius = 15
        previousBtn.setTitle("Previous", for: .normal)
        previousBtn.setTitleColor(.white, for: .normal)
        previousBtn.addTarget(self, action: #selector(onPrevious), for: .touchUpInside)
        return previousBtn
    }()
    
    lazy var pagerControl: UIPageControl = {
       let pc = UIPageControl()
        pc.numberOfPages = arrGuide.count
        pc.tintColor = .white
        pc.currentPageIndicatorTintColor = .black
        pc.translatesAutoresizingMaskIntoConstraints = false
        return pc
    }()
    
    @objc func onSkip() {
//        Logger.info(self.navigationController)
        RouterManager.shared.handleRouter(WelcomeRoute())
    }
    
    @objc func onPrevious() {
        let cell = collectionView.visibleCells.first as? GuideCollectionViewCell
        
        guard let c = cell else {
            return
        }
        let indexPath = collectionView.indexPath(for: c)
        
        guard let idxPath = indexPath, idxPath.row != 0 else {
            return
        }
        
        
        collectionView.scrollToItem(at: IndexPath(row: idxPath.row - 1, section: idxPath.section), at: [.centeredVertically,.centeredHorizontally], animated: true)
        view.layoutIfNeeded()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
    }
    
    func setupLayout() {
        self.collectionView.backgroundColor = .white
        self.collectionView.isPagingEnabled = true
        self.collectionView!.register(GuideCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.showsHorizontalScrollIndicator = false
        
        self.view.addSubview(btnSkip)
        self.view.addSubview(btnPrevious)
        self.view.addSubview(pagerControl)
        
        btnSkip.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        btnSkip.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        btnSkip.widthAnchor.constraint(equalToConstant: 70).isActive = true
        btnSkip.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        btnPrevious.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        btnPrevious.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        btnPrevious.widthAnchor.constraint(equalToConstant: 90).isActive = true
        btnPrevious.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        pagerControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pagerControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        pagerControl.widthAnchor.constraint(equalToConstant: 100).isActive = true
        pagerControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return arrGuide.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = cell as! GuideCollectionViewCell
        cell.onUpdate(arrGuide[indexPath.row])
        pagerControl.currentPage = indexPath.row
    }
    
    override func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GuideCollectionViewCell
        cell.backgroundColor = .white
        // Configure the cell
//        indexPathSelected = indexPath
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: widthScreen, height: heightScreen - heightTabbar)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
