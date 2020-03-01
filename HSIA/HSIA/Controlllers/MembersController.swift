//
//  MembersController.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 27.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit
//import DifferenceKit

struct Sort {
    static func members(members: [MemberModel], character: String) -> [MemberModel] {
        var sortedArr = members
        sortedArr.sort(by: {
            let lastName1 = $0.name.findLastName()
            let lastName2 = $1.name.findLastName()
            // By using the extension function you wrote, find the most occurences of the character for each string in the array and sort in descending order.
            if lastName1.countNumberOfOccurrencesOfCharacter(char: character) != lastName2.countNumberOfOccurrencesOfCharacter(char: character) {
                return lastName1.countNumberOfOccurrencesOfCharacter(char: character) > lastName2.countNumberOfOccurrencesOfCharacter(char: character)
                // If two or more strings contain the same amount for the character, sort these according to their length.
            } else if lastName1.count != lastName2.count {
                return lastName1.count > lastName2.count
                // If two or more strings contain the same amount for the character and have the same length, sort these in alphabetical order.
            } else {
                return lastName1 < lastName2
            }
        })
        return sortedArr
    }
}

class MembersController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    func sortMembers() {
        // When the Sort button is tapped, please call this function for the last names of the members, for the character “a” and update the UI with respect to the sorted list.
//        let newMembers = Sort.members(members: members, character: "a")
        
//        let changeset = StagedChangeset(source: members, target: newMembers)
        
//        collectionView.reload(using: changeset, interrupt: { $0.changeCount > 100 }) { (data) in
//            self.members = data
//        }
    }
    
    var mainController: UIViewController?
    
    fileprivate let headerId = "headerId"
    fileprivate let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.backgroundColor = HSIAColor.backgroundPrimary.color
        
        self.collectionView.register(MembersHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        self.collectionView.register(MembersCell.self, forCellWithReuseIdentifier: cellId)
        
        self.collectionView.alwaysBounceVertical = true
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
        if let name = member.name, let github = member.github, let position = member.hipo?.position {
            cell.setData(image: nil, text: name, subText: "@\(github)\n\(position)")
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let member = members[indexPath.row]
        let detailController = DetailController(member: member)
        mainController?.navigationController?.pushViewController(detailController, animated: true)
    }
    
    fileprivate var members: [MemberCDModel]!
    
    init(members: [MemberCDModel]) {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: Sizing.oneColumn, height: 84)
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
