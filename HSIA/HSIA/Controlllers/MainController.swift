//
//  MainController.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 28.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    fileprivate var buttonsLayer: HSIALayerButtons!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navBar = UINavigationController(rootViewController: MembersController())
        
        navBar.view.addFillSuperview(superview: self.view)
        
        self.addChild(navBar)
        
//        buttonsLayer = HSIALayerButtons()
//        buttonsLayer.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(buttonsLayer)
//
//        NSLayoutConstraint.activate([
//            buttonsLayer.heightAnchor.constraint(equalToConstant: 166),
//            buttonsLayer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            buttonsLayer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//            buttonsLayer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//        ])
    }
    
}
