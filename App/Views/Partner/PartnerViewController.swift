//
//  PartnerViewController.swift
//  Project
//
//  Created by Victor Catão on 28/04/19.
//  Copyright (c) 2019 Catao. All rights reserved.
//

import UIKit

class PartnerViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var nameTextField: CataoTextFieldClass!
    @IBOutlet weak var phoneTextField: CataoTextFieldClass!
    @IBOutlet weak var establishmentNameTextField: CataoTextFieldClass!
    @IBOutlet weak var addressTextField: CataoTextFieldClass!
    @IBOutlet weak var socialNetworkTextField: CataoTextFieldClass!
    @IBOutlet weak var emailTextField: CataoTextFieldClass!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var heightDescriptionTextViewConstraint: NSLayoutConstraint!
    
    // MARK: - Variables
    private let viewModel = PartnerViewModel()
    
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    // MARK: - Setups
    private func setup() {
        title = "Quero Ser Parceiro"
        setupTextFields()
    }
    
    func setupTextFields() {
        nameTextField.setup(textFieldType: .NAME)
        phoneTextField.setup(textFieldType: .PHONE)
        emailTextField.setup(textFieldType: .EMAIL)
        
        self.descriptionTextView.delegate = self
    }
    
    @IBAction func didTapSendButton(_ sender: Any) {
        let (valid, msg) = self.viewModel.validate(
            name: nameTextField.text,
            phone: phoneTextField.text,
            establishmentName: establishmentNameTextField.text,
            address: addressTextField.text,
            socialNetwork: socialNetworkTextField.text,
            email: emailTextField.text,
            description: descriptionTextView.text
        )
        
        if (valid) {
            self.viewModel.createContact(success: {
                self.showSuccessAlert(message: "Obrigado! Entraremos em contato em breve.", okBlock: {
                    self.navigationController?.popViewController(animated: true)
                }, cancelBlock: nil)
            }) { (msg) in
                self.showErrorAlert(message: msg)
            }
        } else {
            self.showErrorAlert(message: msg)
        }
    }
    
}

extension PartnerViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: descriptionTextView.frame.width, height: .infinity)
        let estimatedSize = descriptionTextView.sizeThatFits(size)
        self.heightDescriptionTextViewConstraint.constant = estimatedSize.height
    }
}
