//
//  DetailController.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 28.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit

protocol DetailControllerDelegate {
    func handleDeletedMember(member: MemberCDModel)
}

class DetailController: UIViewController {
    
    var delegate: DetailControllerDelegate?
    
    fileprivate var member: MemberCDModel?
    
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
        let memberDetailController = MemberDetailController(member: member)
        
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
            deleteButton.tag = 1
            let saveButton = HSIAButtonRectangle(text: "save", type: .secondary)
            saveButton.tag = 2
            
            [deleteButton, saveButton].forEach {
                $0.addTarget(self, action: #selector(handleButtons(_:)), for: .primaryActionTriggered)
            }
            
            buttonsLayer.hstack(
                buttonsLayer.stack(
                    deleteButton,
                    saveButton, spacing: 16
                ), alignment: .top
            ).withMargins(.init(top: 16, left: 45, bottom: 0, right: 45))
        } else {
            buttonsLayer.heightAnchor.constraint(equalToConstant: Sizing.oneButtonLayerHeight).isActive = true
            
            let createButton = HSIAButtonRectangle(text: "create", type: .secondary)
            createButton.tag = 3
            
            createButton.addTarget(self, action: #selector(handleButtons(_:)), for: .primaryActionTriggered)
            
            buttonsLayer.hstack(
                createButton, alignment: .top
            ).withMargins(.init(top: 16, left: 45, bottom: 0, right: 45))
        }
    }
    
    @objc fileprivate func handleButtons(_ button: UIButton) {
        switch button.tag {
        case 1:
            print("Delete")
            if let member = member {
                CoreDataManager.shared.deleteMember(member: member)
                delegate?.handleDeletedMember(member: member)
                self.navigationController?.popViewController(animated: true)
            }
        case 2:
            print("Save")
        case 3:
            print("Create")
        default:
            return
        }
    }
    
}
