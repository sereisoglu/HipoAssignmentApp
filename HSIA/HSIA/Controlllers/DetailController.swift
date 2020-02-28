//
//  DetailController.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 28.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit

class DetailHeader: UICollectionReusableView {
    
    fileprivate var tableViewCell: HSIATableViewRowImageSelect!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableViewCell = HSIATableViewRowImageSelect()
        tableViewCell.addCenterInSuperview(superview: self)
    }
    
    func setData(image: UIImage?, text: String) {
        tableViewCell.setData(image: image, text: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class DetailTextFieldCell: UICollectionViewCell {
    
    fileprivate var textField: HSIATextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textField = HSIATextField()
        textField.addFillSuperview(superview: self)
    }
    
    func setData(iconName: HSIAIconName, text: String?, placeholder: String, isJustNumber: Bool) {
        textField.setData(iconName: iconName, text: text, placeholder: placeholder, isJustNumber: isJustNumber)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class DetailTableViewCell: UICollectionViewCell {
    
    fileprivate var tableViewCell: HSIATableViewRowMedium!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableViewCell = HSIATableViewRowMedium()
        tableViewCell.addFillSuperview(superview: self)
    }
    
    func setData(iconName: HSIAIconName, text: String) {
        tableViewCell.setData(leftIconName: iconName, text: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class DetailController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let headerId = "headerId"
    fileprivate let cellTableViewId = "cellTableViewId"
    fileprivate let cellTextFieldId = "cellTextFieldId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.backgroundColor = .white
        
        self.collectionView.register(DetailHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        self.collectionView.register(DetailTableViewCell.self, forCellWithReuseIdentifier: cellTableViewId)
        self.collectionView.register(DetailTextFieldCell.self, forCellWithReuseIdentifier: cellTextFieldId)
        
        self.collectionView.contentInset = .init(top: 16, left: 0, bottom: 16, right: 0)
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.navigationItem.title = "New Member"
        
        self.collectionView.alwaysBounceVertical = true
        
        self.collectionView.keyboardDismissMode = .interactive
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! DetailHeader
        header.setData(image: nil, text: "S e r")
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: self.view.frame.width, height: 122)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTableViewId, for: indexPath) as! DetailTableViewCell
            cell.setData(iconName: .team, text: "Select Team")
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTextFieldId, for: indexPath) as! DetailTextFieldCell
            cell.setData(iconName: .person, text: nil, placeholder: "Position", isJustNumber: false)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTextFieldId, for: indexPath) as! DetailTextFieldCell
            cell.setData(iconName: .calendar, text: nil, placeholder: "Years in Hipo", isJustNumber: true)
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTextFieldId, for: indexPath) as! DetailTextFieldCell
            cell.setData(iconName: .name, text: nil, placeholder: "Name", isJustNumber: false)
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTextFieldId, for: indexPath) as! DetailTextFieldCell
            cell.setData(iconName: .calendar, text: nil, placeholder: "Age", isJustNumber: true)
            return cell
        case 5:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTextFieldId, for: indexPath) as! DetailTextFieldCell
            cell.setData(iconName: .map, text: nil, placeholder: "Location", isJustNumber: false)
            return cell
        case 6:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTextFieldId, for: indexPath) as! DetailTextFieldCell
            cell.setData(iconName: .github, text: nil, placeholder: "Github Username", isJustNumber: false)
            return cell
        default:
            assert(false, "Unexpected indexPath")
        }
    }
    
    
    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        switch indexPath.row {
//        case 0:
//            print(indexPath.row)
//            let picker = UIPickerView()
//            picker.dataSource = self
//            picker.delegate = self
//            
//            let dummy = UITextField(frame: .zero)
//            view.addSubview(dummy)
//            
//            dummy.inputView = picker
//            dummy.becomeFirstResponder()
//            
//            let toolBar = UIToolbar()
//            toolBar.sizeToFit()
//            let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
//            toolBar.setItems([button], animated: true)
//            toolBar.isUserInteractionEnabled = true
//            dummy.inputAccessoryView = toolBar
//        case 2:
//            print(indexPath.row)
//        default:
//            return
//        }
//    }
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: Sizing.oneColumn, height: 44)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 12
        layout.sectionInset.top = 12
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
