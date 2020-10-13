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
    
    lazy var btnNext: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = Color.BackgroundExtendColor()
        btn.layer.cornerRadius = 15
        btn.titleLabel?.font = .boldSystemFont(ofSize: 13)
        btn.setTitle("NEXT", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(onNext), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var btnPrevious: UIButton = {
       let previousBtn = UIButton()
        previousBtn.translatesAutoresizingMaskIntoConstraints = false
        previousBtn.backgroundColor = Color.BackgroundExtendColor()
        previousBtn.layer.cornerRadius = 15
        previousBtn.titleLabel?.font = .boldSystemFont(ofSize: 13)
        previousBtn.setTitle("PREV", for: .normal)
        previousBtn.setTitleColor(.white, for: .normal)
        previousBtn.addTarget(self, action: #selector(onPrevious), for: .touchUpInside)
        previousBtn.isMultipleTouchEnabled = false
        return previousBtn
    }()
    
    lazy var btnSkip: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = Color.BackgroundExtendColor()
        btn.layer.cornerRadius = 15
        btn.titleLabel?.font = .boldSystemFont(ofSize: 13)
        btn.setTitle("SKIP", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(onSkip), for: .touchUpInside)
        btn.isMultipleTouchEnabled = false
        return btn
    }()
    
    lazy var pagerControl: UIPageControl = {
       let pc = UIPageControl()
        pc.numberOfPages = arrGuide.count
        pc.pageIndicatorTintColor = Color.TextTitleColor
        pc.currentPageIndicatorTintColor = Color.MainAppColor()
        pc.translatesAutoresizingMaskIntoConstraints = false
        pc.isUserInteractionEnabled = false
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
        
        pagerControl.currentPage = idxPath.row - 1
    }
    
    @objc func onNext() {
        let cell = collectionView.visibleCells.first as? GuideCollectionViewCell
        
        guard let c = cell else {
            return
        }
        let indexPath = collectionView.indexPath(for: c)
        
        guard let idxPath = indexPath, idxPath.row < arrGuide.count-1 else {
            return
        }
        
        collectionView.scrollToItem(at: IndexPath(row: idxPath.row + 1, section: idxPath.section), at: [.centeredVertically,.centeredHorizontally], animated: true)
        
        pagerControl.currentPage = idxPath.row + 1
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
        self.view.addSubview(btnNext)
        
        btnNext.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        btnNext.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        btnNext.widthAnchor.constraint(equalToConstant: 70).isActive = true
        btnNext.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        btnPrevious.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        btnPrevious.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        btnPrevious.widthAnchor.constraint(equalToConstant: 90).isActive = true
        btnPrevious.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        pagerControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pagerControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        pagerControl.widthAnchor.constraint(equalToConstant: 100).isActive = true
        pagerControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        btnSkip.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        btnSkip.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        btnSkip.widthAnchor.constraint(equalToConstant: 70).isActive = true
        btnSkip.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()

        visibleRect.origin = collectionView.contentOffset
        visibleRect.size = collectionView.bounds.size
        
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)

        guard let indexPath = collectionView.indexPathForItem(at: visiblePoint) else { return}
        
        pagerControl.currentPage = indexPath.row
    }

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
        let cellG = cell as! GuideCollectionViewCell
        cellG.onUpdate(arrGuide[indexPath.row])
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
