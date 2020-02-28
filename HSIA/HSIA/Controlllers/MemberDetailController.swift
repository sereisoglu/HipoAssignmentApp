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
        
        self.collectionView.contentInset = .init(top: 16, left: 0, bottom: 16, right: 0)
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.navigationItem.title = "New Member"
        
        self.collectionView.alwaysBounceVertical = true
        
        self.collectionView.keyboardDismissMode = .interactive
        
        //        if let path = Bundle.main.path(forResource: "hipo", ofType: "json") {
        //            do {
        //                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        //                decodeJSONData(data: data) { (res: HipoModel?, err) in
        //                    if let err = err {
        //                        print("Failed to decode:", err)
        //                        return
        //                    }
        //                    print(res?.members)
        //                }
        //            } catch {
        //                print(error)
        //            }
        //        }
        
        
    }
    
    func decodeJSONData<U: Codable>(data: Data?, completion: @escaping (U?, Error?) -> ()) {
        guard let data = data else { return }
        do {
            let objects = try JSONDecoder().decode(U.self, from: data)
            completion(objects, nil)
        } catch {
            completion(nil, error)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! MemberDetailHeader
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTableViewId, for: indexPath) as! MemberDetailTableViewCell
            cell.setData(iconName: .team, text: "Select Team")
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTextFieldId, for: indexPath) as! MemberDetailTextFieldCell
            cell.setData(iconName: .person, text: nil, placeholder: "Position", isJustNumber: false)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTextFieldId, for: indexPath) as! MemberDetailTextFieldCell
            cell.setData(iconName: .calendar, text: nil, placeholder: "Years in Hipo", isJustNumber: true)
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTextFieldId, for: indexPath) as! MemberDetailTextFieldCell
            cell.setData(iconName: .name, text: nil, placeholder: "Name", isJustNumber: false)
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTextFieldId, for: indexPath) as! MemberDetailTextFieldCell
            cell.setData(iconName: .calendar, text: nil, placeholder: "Age", isJustNumber: true)
            return cell
        case 5:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTextFieldId, for: indexPath) as! MemberDetailTextFieldCell
            cell.setData(iconName: .map, text: nil, placeholder: "Location", isJustNumber: false)
            return cell
        case 6:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellTextFieldId, for: indexPath) as! MemberDetailTextFieldCell
            cell.setData(iconName: .github, text: nil, placeholder: "Github Username", isJustNumber: false)
            return cell
        default:
            assert(false, "Unexpected indexPath")
        }
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
//            let actionSheetController = CustomAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//
//            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
//
//            let movieMoveToWatchListAlertAction = UIAlertAction(title: "Remove", style: .destructive) { (_) in
//                print("movieMoveToWatchListAlert")
//                self.setData(type: .movieWatchList)
//            }
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
