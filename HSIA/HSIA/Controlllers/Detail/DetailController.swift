//
//  DetailController.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 28.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit

protocol DetailControllerDelegate {
    func handleCreatedMember(member: MemberCDModel)
    func handlleUpdatedMember(member: MemberCDModel)
    func handleDeletedMember(member: MemberCDModel)
}

class DetailController: UIViewController {
    
    var delegate: DetailControllerDelegate?
    
    fileprivate var member: MemberCDModel?
    
    fileprivate var memberDetailController: MemberDetailController!
    
    convenience init(member: MemberCDModel? = nil){
        self.init(nibName:nil, bundle:nil)
        self.member = member
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        if let _ = member {
            self.navigationItem.title = "Edit Member"
        } else {
            self.navigationItem.title = "New Member"
        }
        
        setupMembersController()
        setupButtonsLayer()
    }
    
    fileprivate func setupMembersController() {
        memberDetailController = MemberDetailController(member: member)
        memberDetailController.view.addFillSuperview(superview: self.view)
        self.addChild(memberDetailController)
    }
    
    fileprivate func setupButtonsLayer() {
        let buttonsLayer = HSIALayerButtons()
        buttonsLayer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(buttonsLayer)
        
        NSLayoutConstraint.activate([
            buttonsLayer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            buttonsLayer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            buttonsLayer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
        if let _ = member {
            buttonsLayer.heightAnchor.constraint(equalToConstant: Sizing.twoButtonsLayerHeight).isActive = true
            
            let deleteButton = HSIAButtonRectangle(text: "delete", type: .tertiary)
            let saveButton = HSIAButtonRectangle(text: "save", type: .secondary)
            
            [deleteButton, saveButton].enumerated().forEach { (index, item) in
                item.tag = index + 1
                item.addTarget(self, action: #selector(handleButtons(_:)), for: .primaryActionTriggered)
            }
            
            buttonsLayer.hstack(
                buttonsLayer.stack(
                    deleteButton,
                    saveButton, spacing: Sizing.space16pt
                ), alignment: .top
            ).withMargins(.init(top: Sizing.space16pt, left: Sizing.space45pt, bottom: 0, right: Sizing.space45pt))
        } else {
            buttonsLayer.heightAnchor.constraint(equalToConstant: Sizing.oneButtonLayerHeight).isActive = true
            
            let createButton = HSIAButtonRectangle(text: "create", type: .secondary)
            createButton.tag = 3
            
            createButton.addTarget(self, action: #selector(handleButtons(_:)), for: .primaryActionTriggered)
            
            buttonsLayer.hstack(
                createButton, alignment: .top
            ).withMargins(.init(top: Sizing.space16pt, left: Sizing.space45pt, bottom: 0, right: Sizing.space45pt))
        }
    }
    
    @objc fileprivate func handleButtons(_ button: UIButton) {
        switch button.tag {
        case 1:
            if let member = member {
                delegate?.handleDeletedMember(member: member)
                self.navigationController?.popViewController(animated: true)
            }
        case 2:
            let member = memberDetailController.updateMember()
            if let member = member {
                delegate?.handlleUpdatedMember(member: member)
                self.navigationController?.popViewController(animated: true)
            }
        case 3:
            let member = memberDetailController.createMember()
            if let member = member {
                delegate?.handleCreatedMember(member: member)
                self.navigationController?.popViewController(animated: true)
            }
        default:
            return
        }
    }
    
}
