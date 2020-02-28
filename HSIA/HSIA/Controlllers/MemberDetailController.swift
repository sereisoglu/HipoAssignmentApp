//
//  MemberDetailController.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 28.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit

class MemberDetailController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let headerId = "headerId"
    fileprivate let cellTableViewId = "cellTableViewId"
    fileprivate let cellTextFieldId = "cellTextFieldId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.backgroundColor = HSIAColor.backgroundPrimary.color
        
        self.collectionView.register(MemberDetailHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        self.collectionView.register(MemberDetailTableViewCell.self, forCellWithReuseIdentifier: cellTableViewId)
        self.collectionView.register(MemberDetailTextFieldCell.self, forCellWithReuseIdentifier: cellTextFieldId)
        
        var bottomInset: CGFloat = 0
        if let _ = member {
            bottomInset = Sizing.twoButtonsCollectionViewBottomInset
        } else {
            bottomInset = Sizing.oneButtonCollectionViewBottomInset
        }
        
        self.collectionView.contentInset = .init(top: 16, left: 0, bottom: bottomInset, right: 0)
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.navigationItem.title = "New Member"
        
        self.collectionView.alwaysBounceVertical = true
        
        self.collectionView.keyboardDismissMode = .interactive
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! MemberDetailHeader
        header.setData(image: nil, text: member?.name ?? "")
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTableViewId, for: indexPath) as! MemberDetailTableViewCell
            cell.setData(iconName: .team, text: "Select Team")
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTextFieldId, for: indexPath) as! MemberDetailTextFieldCell
            cell.setData(iconName: .name, text: member?.name, placeholder: "Name", isJustNumber: false)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTextFieldId, for: indexPath) as! MemberDetailTextFieldCell
            cell.setData(iconName: .github, text: member?.github, placeholder: "Github Username", isJustNumber: false)
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTextFieldId, for: indexPath) as! MemberDetailTextFieldCell
            cell.setData(iconName: .calendar, text: member?.age.stringValue, placeholder: "Age", isJustNumber: true)
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTextFieldId, for: indexPath) as! MemberDetailTextFieldCell
            cell.setData(iconName: .map, text: member?.location, placeholder: "Location", isJustNumber: false)
            return cell
        case 5:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTextFieldId, for: indexPath) as! MemberDetailTextFieldCell
            cell.setData(iconName: .person, text: member?.hipo.position, placeholder: "Position", isJustNumber: false)
            return cell
        case 6:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTextFieldId, for: indexPath) as! MemberDetailTextFieldCell
            cell.setData(iconName: .calendar, text: member?.hipo.yearsInHipo.stringValue, placeholder: "Years in Hipo", isJustNumber: true)
            return cell
        default:
            assert(false, "Unexpected indexPath")
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let actionSheetController = CustomAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            var alertActions = [UIAlertAction]()
            let alertActionTitles = ["Frontend Team", "Backend Team", "iOS Team", "Android Team", "Design Team"]
            
            alertActionTitles.enumerated().forEach { (index, item) in
                let alertAction = UIAlertAction(title: item, style: .default) { (_) in
                    let cell = collectionView.cellForItem(at: .init(row: 0, section: 0)) as! MemberDetailTableViewCell
                    cell.setData(iconName: .team, text: item)
                    print("Clicked -->", index)
                }
                alertActions.append(alertAction)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
            alertActions.append(cancelAction)
            
            alertActions.forEach {
                actionSheetController.addAction($0)
            }
            
            // https://stackoverflow.com/questions/55653187/swift-default-alertviewcontroller-breaking-constraints
            actionSheetController.pruneNegativeWidthConstraints()
            self.present(actionSheetController, animated: true, completion: nil)
        }
    }
    
    fileprivate var member: MemberModel?
    
    init(member: MemberModel?) {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: Sizing.oneColumn, height: 44)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 12
        layout.sectionInset.top = 12
        super.init(collectionViewLayout: layout)
        self.member = member
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
