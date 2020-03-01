//
//  MemberDetailController.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 28.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit

class MemberDetailController: UICollectionViewController {
    
    fileprivate var selectedTeamId: Int?
    
    fileprivate var member: MemberCDModel?
    
    fileprivate let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.backgroundColor = HSIAColor.backgroundPrimary.color
        
        self.collectionView.register(MemberDetailCell.self, forCellWithReuseIdentifier: cellId)
        
        var bottomInset: CGFloat = 0
        if let _ = member {
            bottomInset = Sizing.twoButtonsCollectionViewBottomInset
        } else {
            bottomInset = Sizing.oneButtonCollectionViewBottomInset
        }
        
        self.collectionView.contentInset = .init(top: 16, left: 0, bottom: bottomInset, right: 0)
        self.collectionView.alwaysBounceVertical = true
        self.collectionView.keyboardDismissMode = .interactive
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MemberDetailCell
        cell.delegate = self
        if let member = member {
            cell.setData(imageData: member.imageData, teamName: member.team?.name, name: member.name, githubUsername: member.github, age: member.age.stringValue, location: member.location, position: member.hipo?.position, yearsInHipo: member.hipo?.yearsInHipo.stringValue)
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func getCell() -> MemberDetailCell {
        let cell = self.collectionView.cellForItem(at: .init(row: 0, section: 0)) as! MemberDetailCell
        return cell
    }
    
    func createMember() {
        let cell = self.collectionView.cellForItem(at: .init(row: 0, section: 0)) as! MemberDetailCell
        let memberInfo = cell.getData()
        if let teamId = selectedTeamId, let name = memberInfo.name, let github = memberInfo.githubUsername, let age = memberInfo.age, let ageInt = Int(age), let location = memberInfo.location, let position = memberInfo.position, let yearsInHipo = memberInfo.yearsInHipo, let yearsInHipoInt = Int(yearsInHipo) {
            CoreDataManager.shared.createMember(image: memberInfo.image, teamId: teamId, name: name, github: github, age: ageInt, location: location, position: position, yearsInHipo: yearsInHipoInt)
        }
    }
    
    init(member: MemberCDModel?) {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: Sizing.oneColumn, height: 514)
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

extension MemberDetailController: HSIATableViewRowImageSelectDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func handleButton() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.modalPresentationStyle = .currentContext
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // image boyutu cok buyukse kucult
        let cell = collectionView.cellForItem(at: .init(item: 0, section: 0)) as! MemberDetailCell
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            cell.setData(imageData: editedImage.jpegData(compressionQuality: 0.5))
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            cell.setData(imageData: originalImage.jpegData(compressionQuality: 0.5))
        }
        
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
}

extension MemberDetailController: MemberDetailCellDelegate {
    func handleSelectTeam() {
        
        let actionSheetController = CustomAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        var alertActions = [UIAlertAction]()
        let alertActionTitles = Teams.allCasesNameArr
        
        alertActionTitles.enumerated().forEach { (index, item) in
            let alertAction = UIAlertAction(title: item, style: .default) { (_) in
                let cell = self.collectionView.cellForItem(at: .init(row: 0, section: 0)) as! MemberDetailCell
                cell.setData(teamName: item)
                self.selectedTeamId = index
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
