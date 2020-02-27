//
//  MembersController.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 27.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
//    override var frame: CGRect {
//        get {
//            return super.frame
//        }
//        set (newFrame) {
//            let inset: CGFloat = 15
//            var frame = newFrame
//            frame.origin.x += inset
//            frame.size.width -= 2 * inset
//            super.frame = frame
//        }
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        self.layer.cornerRadius = 10
//        self.clipsToBounds = true
//        self.layer.masksToBounds = true
        
        self.backgroundColor = .yellow
        
        self.textLabel?.text = "Saffet"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MainController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navBar = UINavigationController(rootViewController: MembersController())
        
        navBar.view.addFillSuperview(superview: self.view)
        
        self.addChild(navBar)
        
        let deneme = UIView(backgroundColor: .red)
        
        self.view.hstack(
            deneme.withHeight(300), alignment: .bottom
        )
    }
    
}

class MembersController: UITableViewController {
    
    fileprivate let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = .white
        
        self.tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: cellId)
        
        self.tableView.layer.cornerRadius = 10
        self.tableView.clipsToBounds = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
//        cell.backgroundColor = .init(white: 0.95, alpha: 1)
        
//        let view = HSIATableViewRowMedium()
//        view.setData(leftIconName: .calendar, text: "Select Age")
//        view.addCenterInSuperview(superview: cell)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            // delete item at indexPath
        }

        let share = UITableViewRowAction(style: .normal, title: "Disable") { (action, indexPath) in
            // share item at indexPath
        }

        share.backgroundColor = UIColor.blue

        return [delete, share]
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
}
