//
//  EmailController.swift
//  BaseDemo
//
//  Created by macOS on 9/17/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

enum Extend_Type : String, CaseIterable {
    case notes = "Notes"
    case tasks = "Tasks"
    case activities = "Historical Activities"
    case chat = "Chat"
    case comments = "Comments"
    case attachments = "Attachments"
    case event = "Event"
    case email = "Email"
    
    static var allCases: [Extend_Type] {
        return [.notes, .tasks, .chat, .comments, .attachments, .event, .activities]
    }
}

class ExtendController: BaseViewController {

    //outlet
    
    //variable
    public var extendedType : Extend_Type?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        Logger.info("khiemht")
//        setupSubView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupSubView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    func setupSubView() {
        
        var subView : BaseView
        
        let frame = CGRect(origin: CGPoint.zero, size: CGSize(width: widthScreen, height: heightScreen))
        
        switch extendedType {
        case .email:
            subView = EmailView.xibInstance()
        case .notes:
            subView = NotesView()
            subView.delegateAddSubView = self
        case .tasks:
            subView = TasksView()
            subView.delegateAddSubView = self
        case .chat:
            subView = ArticlesView()
        case .comments:
            subView = CommentsView()
        case .attachments:
            subView = AttachmentsView()
        case .event:
            subView = EventView()
        case .activities:
            subView = CustomerJourneyView()
        default:
            subView = EmailView()
        }

        Logger.info(frame)
        Logger.info(self.view.bounds)
        
        subView.frame = self.view.bounds
        subView.controller = self
        self.view.addSubview(subView)
        
        Logger.info(vContent.bounds)
    }

}

extension ExtendController: XibInitalization {
    typealias Element = ExtendController
}

extension ExtendController: BaseViewOutput {
    func didAddNew(type: String) {
        if type == Extend_Type.notes.rawValue {

            let vc = UIViewController()
            let presenter = PresenterView.xibInstance()
            presenter.vTitle.lblTitle.text = "Create new note"
            
            let creatNote = CreatNewNote.xibInstance()
            creatNote.hideSave()
            creatNote.hideBack()
            creatNote.vTitleView.isHidden = true
            creatNote.frame = CGRect(x: sectionInsetsDefault.left, y: CGPoint.zero.y, width: presenter.vContent.bounds.width, height: presenter.vContent.bounds.height)
                
            vc.view.addSubview(presenter)
            presenter.frame = vc.view.bounds
            
            presenter.onChangeAction(type: .save)
            presenter.vContent.addSubview(creatNote)
            
            presenter.controller = self
            presenter.delegate = vc
            self.navigationController?.pushViewController(vc, animated: true)
        } else if type == Extend_Type.tasks.rawValue {
            let arrData = ["Assign to","Subject","Date/Time","Priority","Status","Name","Related to","Reminder set?","Description"]
            let vMagic = MagicCollectionView.xibInstance()
            vMagic.collectionView.registerCell(TicketDetailInputInfoCollectionViewCell.self)
            vMagic.heightCell = heightLargeCell
            vMagic.heightHeader = heightHeaderDefault
            vMagic.dictData = ["0": arrData]
            vMagic.controller = self
            vMagic.viewType = .auto
            //config
            generateView(subView: vMagic, title: "New task")
        }
    }

}
