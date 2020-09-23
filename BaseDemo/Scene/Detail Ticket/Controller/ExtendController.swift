//
//  EmailController.swift
//  BaseDemo
//
//  Created by macOS on 9/17/20.
//  Copyright © 2020 BASEBS. All rights reserved.
//

import UIKit

enum Extend_Type : String, CaseIterable {
    case email = "Email"
    case notes = "Notes"
    case tasks = "Tasks"
    case activity_history = "Activity History"
    case articles = "Articles"
    case comments = "Comments"
    case attachments = "Attachments"
    case event = "Event"
    case customer_journey = "Customer Journey"
    
    static var allCases: [Extend_Type] {
        return [.email, .notes, .tasks, .activity_history, .articles, .comments, .attachments, .event, .customer_journey]
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupSubView()
    }

    func setupSubView() {
        var subView : BaseView
        
        switch extendedType {
        case .email:
            subView = EmailView.xibInstance()
        case .notes:
            subView = NotesView.xibInstance()
            subView.delegateAddSubView = self
        case .tasks:
            subView = TasksView.xibInstance()
            subView.delegateAddSubView = self
        case .activity_history:
            subView = ActivitiesView(frame: vContent.bounds)
        case .articles:
            subView = ArticlesView(frame: vContent.bounds)
        case .comments:
            subView = CommentsView(frame: vContent.bounds)
        case .attachments:
            subView = AttachmentsView(frame: vContent.bounds)
        case .event:
            subView = EventView(frame: vContent.bounds)
        case .customer_journey:
            subView = CustomerJourneyView(frame: vContent.bounds)
        default:
            subView = EmailView(frame: vContent.bounds)
        }

        subView.frame = vContent.bounds
        subView.controller = self
        vContent.addSubview(subView)
    }

}

extension ExtendController: XibInitalization {
    typealias Element = ExtendController
}

extension ExtendController: BaseViewOutput {
    func didAddNew() {
        let creatNote = CreatNewNote.xibInstance()
        view.addSubview(creatNote)
        creatNote.frame = view.bounds
    }
}
