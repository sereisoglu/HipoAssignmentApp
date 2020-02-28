//
//  MembersController.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 27.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit

class MembersController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var mainController: UIViewController?
    
    fileprivate let headerId = "headerId"
    fileprivate let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.backgroundColor = HSIAColor.backgroundPrimary.color
        
        self.collectionView.register(MembersHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        self.collectionView.register(MembersCell.self, forCellWithReuseIdentifier: cellId)
        
        self.collectionView.contentInset = .init(top: 16, left: 0, bottom: Sizing.twoButtonsCollectionViewBottomInset, right: 0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! MembersHeader
        header.setData(headerText: "iOS Team")
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: self.view.frame.width, height: 42)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return members.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MembersCell
        let member = members[indexPath.row]
        cell.setData(image: nil, text: member.name, subText: "@\(member.github)")
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let member = members[indexPath.row]
        let detailController = DetailController(member: member)
        mainController?.navigationController?.pushViewController(detailController, animated: true)
    }
    
    fileprivate var members: [MemberModel]!
    
    init(members: [MemberModel]) {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: Sizing.oneColumn, height: 64)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 12
//        layout.headerReferenceSize = .init(width: Sizing.deviceSize.width, height: 100)
        super.init(collectionViewLayout: layout)
        self.members = members
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
