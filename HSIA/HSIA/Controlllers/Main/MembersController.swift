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
    
    fileprivate var allMembers = [[MemberCDModel]]()
    
    fileprivate let headerId = "headerId"
    fileprivate let cellId = "cellId"
    fileprivate let footerId = "footerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.backgroundColor = HSIAColor.backgroundPrimary.color
        
        self.collectionView.register(MembersHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        self.collectionView.register(MembersCell.self, forCellWithReuseIdentifier: cellId)
        self.collectionView.register(MembersFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerId)
        
        self.collectionView.contentInset = .init(top: Sizing.space16pt, left: 0, bottom: Sizing.twoButtonsCollectionViewBottomInset, right: 0)
        self.collectionView.alwaysBounceVertical = true
        
        fetchMembers()
    }
    
    fileprivate func fetchMembers() {
        let members = CoreDataManager.shared.fetchMembers()
        
        allMembers = [
            members.filter { $0.team?.id == Teams.iOS.id },
            members.filter { $0.team?.id == Teams.hardware.id },
            members.filter { $0.team?.id == Teams.android.id },
            members.filter { $0.team?.id == Teams.qaAutomation.id },
            members.filter { $0.team?.id == Teams.webFrontend.id },
            members.filter { $0.team?.id == Teams.backend.id },
        ]
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! MembersHeader
            header.setData(headerText: Teams.allCasesNameArr[indexPath.section])
            return header
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath)
            return footer
        default:
            assert(false, "Unexpected element kind.")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return allMembers[section].count == 0 ? Sizing.tableViewRowHeaderAndFooterSize : .zero
    }
    
    // Cell
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return allMembers.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allMembers[section].count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MembersCell
        let member = allMembers[indexPath.section][indexPath.item]
        if let name = member.name, let github = member.github, let position = member.hipo?.position {
            cell.setData(imageData: member.imageData, text: name, subText: "@\(github)\n\(position)")
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let member = allMembers[indexPath.section][indexPath.item]
        let detailController = DetailController(member: member)
        detailController.delegate = self
        mainController?.navigationController?.pushViewController(detailController, animated: true)
    }
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = Sizing.tableViewRowLargeSize
        layout.minimumLineSpacing = Sizing.space12pt
        layout.minimumInteritemSpacing = 0
        layout.headerReferenceSize = Sizing.tableViewRowHeaderAndFooterSize
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - CRUD Operation
extension MembersController: DetailControllerDelegate {
    
    func handleCreatedMember(member: MemberCDModel) {
        let teamNames = Teams.allCasesNameArr
        guard let teamName = member.team?.name else { return }
        guard let sectionIndex = teamNames.firstIndex(of: teamName) else { return }
        let itemIndex = allMembers[sectionIndex].count
        let indexPath = IndexPath(item: itemIndex, section: sectionIndex)
        allMembers[sectionIndex].insert(member, at: itemIndex)
        self.collectionView.insertItems(at: [indexPath])
    }
    
    func handlleUpdatedMember(member: MemberCDModel) {
        fetchMembers()
        self.collectionView.reloadData()
    }
    
    func handleDeletedMember(member: MemberCDModel) {
        let teamNames = Teams.allCasesNameArr
        guard let teamName = member.team?.name else { return }
        guard let sectionIndex = teamNames.firstIndex(of: teamName) else { return }
        guard let itemIndex = allMembers[sectionIndex].firstIndex(of: member) else { return }
        let indexPath = IndexPath(item: itemIndex, section: sectionIndex)
        CoreDataManager.shared.deleteMember(member: member)
        allMembers[sectionIndex].remove(at: itemIndex)
        self.collectionView.deleteItems(at: [indexPath])
    }
}

// MARK: - Sort Operation
extension MembersController {
    func sortMembers() {
        // When the Sort button is tapped, please call this function for the last names of the members, for the character “a” and update the UI with respect to the sorted list.
        allMembers.enumerated().forEach { (index, item) in
            allMembers[index] = sort(members: item, character: "a")
        }
        self.collectionView.reloadData()
    }
    
    fileprivate func sort(members: [MemberCDModel], character: String) -> [MemberCDModel] {
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
