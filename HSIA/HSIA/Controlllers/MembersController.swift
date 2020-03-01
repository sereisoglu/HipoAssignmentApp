//
//  MembersController.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 27.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit

struct Sort {
    static func members(members: [MemberCDModel], character: String) -> [MemberCDModel] {
        var sortedArr = members
        sortedArr.sort(by: {
            let lastName1 = $0.name?.findLastName() ?? ""
            let lastName2 = $1.name?.findLastName() ?? ""
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

class MembersController: UICollectionViewController, DetailControllerDelegate {
    
    func handleCreatedMember() {
        members = CoreDataManager.shared.fetchMembers()
        self.collectionView.reloadData()
    }
    
    func handleDeletedMember(member: MemberCDModel) {
        let index = members.firstIndex(of: member)
        guard let item = index else { return }
        let indexPath = IndexPath(item: item, section: 0)
        members.remove(at: item)
        self.collectionView.deleteItems(at: [indexPath])
    }
    
    func sortMembers() {
        // When the Sort button is tapped, please call this function for the last names of the members, for the character “a” and update the UI with respect to the sorted list.
        members = Sort.members(members: members, character: "a")
        self.collectionView.reloadData()
    }
    
    var mainController: UIViewController?
    
    fileprivate var members: [MemberCDModel]!
    
    fileprivate let headerId = "headerId"
    fileprivate let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.members = CoreDataManager.shared.fetchMembers()
        
        self.collectionView.backgroundColor = HSIAColor.backgroundPrimary.color
        
        self.collectionView.register(MembersHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        self.collectionView.register(MembersCell.self, forCellWithReuseIdentifier: cellId)
        
        self.collectionView.contentInset = .init(top: 16, left: 0, bottom: Sizing.twoButtonsCollectionViewBottomInset, right: 0)
        self.collectionView.alwaysBounceVertical = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! MembersHeader
        header.setData(headerText: "iOS Team")
        return header
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return members.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MembersCell
        let member = members[indexPath.row]
        if let name = member.name, let github = member.github, let position = member.hipo?.position {
            cell.setData(imageData: member.imageData, text: name, subText: "@\(github)\n\(position)")
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let member = members[indexPath.row]
        let detailController = DetailController(member: member)
        detailController.delegate = self
        mainController?.navigationController?.pushViewController(detailController, animated: true)
    }
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: Sizing.oneColumn, height: 84)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 12
        layout.headerReferenceSize = .init(width: Sizing.deviceSize.width, height: 42)
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
