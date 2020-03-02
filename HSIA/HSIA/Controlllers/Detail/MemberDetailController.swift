//
//  MemberDetailController.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 28.02.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit
import LBTATools

class MemberDetailController: LBTAFormController {
    
    fileprivate var selectedTeamId: Int16?
    
    fileprivate var member: MemberCDModel?
    
    init(member: MemberCDModel?) {
        super.init(alignment: .top)
        
        self.member = member
        self.selectedTeamId = member?.team?.id
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate var selectImageTableViewCell: HSIATableViewRowImageSelect!
    fileprivate var selectTeamTableViewCell: HSIATableViewRowMedium!
    fileprivate var nameTextField: HSIATextField!
    fileprivate var githubUsernameTextField: HSIATextField!
    fileprivate var ageTextField: HSIATextField!
    fileprivate var locationTextField: HSIATextField!
    fileprivate var positionTextField: HSIATextField!
    fileprivate var yearsInHipoTextField: HSIATextField!
    
    fileprivate var scrollViewHolder = UIView()
    
    fileprivate var tapGestureRecognizer: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = HSIAColor.backgroundPrimary.color
        
        self.scrollView.contentInsetAdjustmentBehavior = .always
        
        var bottomInset: CGFloat = 0
        if let _ = member {
            bottomInset = Sizing.twoButtonsCollectionViewBottomInset
        } else {
            bottomInset = Sizing.oneButtonCollectionViewBottomInset
        }
        
        formContainerStackView.axis = .vertical
        formContainerStackView.layoutMargins = .init(top: Sizing.space16pt, left: Sizing.space20pt, bottom: bottomInset, right: Sizing.space20pt)
        formContainerStackView.addArrangedSubview(scrollViewHolder)
        
        selectImageTableViewCell = HSIATableViewRowImageSelect()
        selectImageTableViewCell.delegate = self
        selectTeamTableViewCell = HSIATableViewRowMedium()
        selectTeamTableViewCell.setData(leftIconName: .team, text: "Select Team")
        nameTextField = HSIATextField(iconName: .name, placeholder: "Name")
        githubUsernameTextField = HSIATextField(iconName: .github, placeholder: "Github Username")
        ageTextField = HSIATextField(iconName: .calendar, placeholder: "Age", keyboardType: .numberPad)
        locationTextField = HSIATextField(iconName: .map, placeholder: "Location")
        positionTextField = HSIATextField(iconName: .person, placeholder: "Position")
        yearsInHipoTextField = HSIATextField(iconName: .hipo, placeholder: "Years in Hipo", keyboardType: .numberPad)
        
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleSelectTeam))
        selectTeamTableViewCell.addGestureRecognizer(tapGestureRecognizer)
        
        scrollViewHolder.stack(
            selectImageTableViewCell,
            selectTeamTableViewCell,
            nameTextField,
            githubUsernameTextField,
            ageTextField,
            locationTextField,
            positionTextField,
            yearsInHipoTextField, spacing: Sizing.space12pt
        )
        
        if let member = member {
            selectImageTableViewCell.setData(name: member.name, imageData: member.imageData)
            selectTeamTableViewCell.setData(text: member.team?.name)
            nameTextField.setData(text: member.name)
            githubUsernameTextField.setData(text: member.github)
            ageTextField.setData(text: member.age.stringValue)
            locationTextField.setData(text: member.location)
            positionTextField.setData(text: member.hipo?.position)
            yearsInHipoTextField.setData(text: member.hipo?.yearsInHipo.stringValue)
        }
    }
    
    func createMember() -> MemberCDModel? {
        let memberInfo = getData()
        if let teamId = selectedTeamId, let name = memberInfo.name, let github = memberInfo.githubUsername, let age = memberInfo.age, let ageInt = Int16(age), let location = memberInfo.location, let position = memberInfo.position, let yearsInHipo = memberInfo.yearsInHipo, let yearsInHipoInt = Int16(yearsInHipo) {
            return CoreDataManager.shared.createMember(image: memberInfo.image, teamId: teamId, name: name, github: github, age: ageInt, location: location, position: position, yearsInHipo: yearsInHipoInt)
        } else {
            let alertController = UIAlertController(title: "Empty Field", message: "Please make sure all fields are filled in correctly.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            return nil
        }
    }
    
    func updateMember() -> MemberCDModel? {
        let memberInfo = getData()
        if let member = member, let teamId = selectedTeamId, let name = memberInfo.name, let github = memberInfo.githubUsername, let age = memberInfo.age, let ageInt = Int16(age), let location = memberInfo.location, let position = memberInfo.position, let yearsInHipo = memberInfo.yearsInHipo, let yearsInHipoInt = Int16(yearsInHipo) {
            CoreDataManager.shared.updateMember(member: member, image: memberInfo.image, teamId: teamId, name: name, github: github, age: ageInt, location: location, position: position, yearsInHipo: yearsInHipoInt)
            return member
        } else {
            let alertController = UIAlertController(title: "Error", message: "There was a problem updating the member. Please try again.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            return nil
        }
    }
    
    fileprivate func getData() -> (image: UIImage?, name: String?, githubUsername: String?, age: String?, location: String?, position: String?, yearsInHipo: String?) {
        return (image: selectImageTableViewCell.getData(), name: nameTextField.getData(), githubUsername: githubUsernameTextField.getData(), age: ageTextField.getData(), location: locationTextField.getData(), position: positionTextField.getData(), yearsInHipo: yearsInHipoTextField.getData())
    }
    
    @objc fileprivate func handleSelectTeam() {
        let actionSheetController = UIAlertController(title: "Teams", message: nil, preferredStyle: .actionSheet)
        let alertActionTitles = Teams.allCasesNameArr
        var alertActions = [UIAlertAction]()
        alertActionTitles.enumerated().forEach { (index, item) in
            let alertAction = UIAlertAction(title: item, style: .default) { (_) in
                self.selectTeamTableViewCell.setData(leftIconName: nil, text: item)
                self.selectedTeamId = Int16(index + 1)
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
    
    deinit {
        selectTeamTableViewCell.removeGestureRecognizer(tapGestureRecognizer)
    }
    
}

// MARK: - UIImagePickerController

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
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            selectImageTableViewCell.setData(name: nil, imageData: editedImage.jpegData(compressionQuality: 0.5))
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectImageTableViewCell.setData(name: nil, imageData: originalImage.jpegData(compressionQuality: 0.5))
        }
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
}
