//
//  ItemAddDashboardView.swift
//  BaseDemo
//
//  Created by macOS on 10/27/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

protocol ItemAddDashboardViewDelegate: class {
    func onFinishSelectedItem()
}

class ItemAddDashboardView: BaseView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    //variable
    private var arrItems = ["Newly created articles","Active users"]
    private let cellID = "cellID"
    public weak var delegate: ItemAddDashboardViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Add an item in Dashboard"
        label.textColor = UIColor(hex: "#FFFFFF")
        label.font = UIFont.systemFont(ofSize: 15.0, weight: .medium)
//        label.frame = CGRect(x: 52.0, y: 12.0, width: 100, height: 50)
        
        
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tbl = UITableView()
        tbl.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tbl.dataSource = self
        tbl.delegate = self
        tbl.backgroundColor = UIColor(hex: "#044743")
        
        return tbl
    }()
    
    private func setupLayout() {
        self.backgroundColor = UIColor(hex: "#044743")
        self.layer.cornerRadius = 12.0
        self.clipsToBounds = true
        
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.frame = CGRect(origin: CGPoint(x: 16, y: 0), size: CGSize(width: self.bounds.width, height: 50))
        tableView.frame = CGRect(x: 0, y: self.titleLabel.bounds.height, width: self.bounds.width, height: self.bounds.height - titleLabel.bounds.height)
        
        self.addSubview(titleLabel)
        self.addSubview(tableView)
//        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
//        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16).isActive = true
//        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
//        titleLabel.heightAnchor.constraint(equalToConstant: heightTabbar)
        
        
//        NSLayoutConstraint.activate([
//            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16),
//            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
//            titleLabel.heightAnchor.constraint(equalToConstant: heightTabbar)
//        ])
//
//        NSLayoutConstraint.activate([
//            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16),
//            tableView.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 16),
//            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 16)
//        ])
        //FIXME #urgent
        
        
    }
}

extension ItemAddDashboardView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.onFinishSelectedItem()
    }
}

extension ItemAddDashboardView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let nameTitle = arrItems[indexPath.row]
        let nameImage = nameTitle.lowercased().replacingOccurrences(of: " ", with: "")
        Logger.info(nameImage)
        cell.imageView?.image = UIImage(named: nameImage)
        cell.textLabel?.text = nameTitle
        cell.textLabel?.textColor = .white
        cell.backgroundColor = UIColor(hex: "#044743")
        
        return cell
    }
}
