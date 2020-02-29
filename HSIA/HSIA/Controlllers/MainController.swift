//
//  MainController.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 28.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    fileprivate var members: [MemberModel]!
    
    fileprivate func decodeJSONDataFile() {
        if let path = Bundle.main.path(forResource: "hipo", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                decodeJSONData(data: data) { (res: HipoModel?, err) in
                    if let err = err {
                        print("Failed to decode:", err)
                        return
                    }
                    self.members = res?.members ?? []
                }
            } catch {
                print(error)
            }
        }
    }
    
    fileprivate func decodeJSONData<U: Codable>(data: Data?, completion: @escaping (U?, Error?) -> ()) {
        guard let data = data else { return }
        do {
            let objects = try JSONDecoder().decode(U.self, from: data)
            completion(objects, nil)
        } catch {
            completion(nil, error)
        }
    }
    
    convenience init(){
        self.init(nibName:nil, bundle:nil)
        
        decodeJSONDataFile()
        members.append(.init(name: "Saffet Emin Reisoglu", location: "Sakarya", github: "sereisoglu", age: 21, hipo: .init(position: "Stajyer", yearsInHipo: 0)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Hipo Members"
        
        setupMembersController()
        setupButtonsLayer()
    }
    
    fileprivate var membersController: MembersController!
    
    fileprivate func setupMembersController() {
        membersController = MembersController(members: members)
        membersController.mainController = self
        
        membersController.view.addFillSuperview(superview: self.view)
        
        self.addChild(membersController)
    }
    
    fileprivate func setupButtonsLayer() {
        let buttonsLayer = HSIALayerButtons()
        buttonsLayer.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(buttonsLayer)
        
        NSLayoutConstraint.activate([
            buttonsLayer.heightAnchor.constraint(equalToConstant: Sizing.twoButtonsLayerHeight),
            buttonsLayer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            buttonsLayer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            buttonsLayer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
        
        let sortMembersButton = HSIAButtonRectangle(text: "sort members", type: .primary)
        sortMembersButton.tag = 1
        let addNewMemberButton = HSIAButtonRectangle(text: "add new member", type: .secondary)
        addNewMemberButton.tag = 2
        
        [sortMembersButton, addNewMemberButton].forEach {
            $0.addTarget(self, action: #selector(handleButtons(_:)), for: .primaryActionTriggered)
        }
        
        buttonsLayer.hstack(
            buttonsLayer.stack(
                sortMembersButton,
                addNewMemberButton, spacing: 16
            ), alignment: .top
        ).withMargins(.init(top: 16, left: 45, bottom: 0, right: 45))
    }
    
    @objc fileprivate func handleButtons(_ button: UIButton) {
        switch button.tag {
        case 1:
            membersController.sortMembers()
        case 2:
            let detailController = DetailController()
            self.navigationController?.pushViewController(detailController, animated: true)
        default:
            return
        }
    }
    
}
