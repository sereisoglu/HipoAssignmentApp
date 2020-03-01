//
//  MemberDetailCell.swift
//  HSIA
//
//  Created by Saffet Emin Reisoğlu on 1.03.2020.
//  Copyright © 2020 Saffet Emin Reisoğlu. All rights reserved.
//

import UIKit
import LBTATools

protocol MemberDetailCellDelegate {
    func handleSelectTeam()
}

class MemberDetailCell: UICollectionViewCell {
    
    var delegate: (HSIATableViewRowImageSelectDelegate & MemberDetailCellDelegate)? {
        didSet {
            selectImageTableViewCell.delegate = delegate
        }
    }
    
    fileprivate var selectImageTableViewCell: HSIATableViewRowImageSelect!
    fileprivate var selectTeamTableViewCell: HSIATableViewRowMedium!
    fileprivate var nameTextField: HSIATextField!
    fileprivate var githubUsernameTextField: HSIATextField!
    fileprivate var ageTextField: HSIATextField!
    fileprivate var locationTextField: HSIATextField!
    fileprivate var positionTextField: HSIATextField!
    fileprivate var yearsInHipoTextField: HSIATextField!
    
    fileprivate var tapGestureRecognizer: UITapGestureRecognizer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        selectImageTableViewCell = HSIATableViewRowImageSelect()
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
        
        stack(
            selectImageTableViewCell,
            selectTeamTableViewCell,
            nameTextField,
            githubUsernameTextField,
            ageTextField,
            locationTextField,
            positionTextField,
            yearsInHipoTextField, spacing: 12
        )
    }
    
    @objc fileprivate func handleSelectTeam() {
        delegate?.handleSelectTeam()
    }
    
    func setData(imageData: Data?) {
        selectImageTableViewCell.setData(name: nil, imageData: imageData)
    }
    
    func setData(teamName: String?) {
        selectTeamTableViewCell.setData(leftIconName: nil, text: teamName)
    }
    
    func setData(imageData: Data?, teamName: String?, name: String?, githubUsername: String?, age: String?, location: String?, position: String?, yearsInHipo: String?) {
        selectImageTableViewCell.setData(name: name, imageData: imageData)
        selectTeamTableViewCell.setData(text: teamName)
        nameTextField.setData(text: name)
        githubUsernameTextField.setData(text: githubUsername)
        ageTextField.setData(text: age)
        locationTextField.setData(text: location)
        positionTextField.setData(text: position)
        yearsInHipoTextField.setData(text: yearsInHipo)
    }
    
    func getData() -> (image: UIImage?, name: String?, githubUsername: String?, age: String?, location: String?, position: String?, yearsInHipo: String?) {
        return (image: selectImageTableViewCell.getData(), name: nameTextField.getData(), githubUsername: githubUsernameTextField.getData(), age: ageTextField.getData(), location: locationTextField.getData(), position: positionTextField.getData(), yearsInHipo: yearsInHipoTextField.getData())
    }
    
    deinit {
        selectTeamTableViewCell.removeGestureRecognizer(tapGestureRecognizer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
