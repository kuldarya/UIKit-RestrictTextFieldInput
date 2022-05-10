//
//  TextFieldsViewController.swift
//  UIKitRestrictingInput
//
//  Created by Darya Kuliashova on 06/05/2022.
//

import UIKit

final class TextFieldsViewController: UIViewController {
    @IBOutlet weak var restrictWhitespacesTextField: UITextField!
    @IBOutlet weak var restrictLettersTextField: UITextField!
    @IBOutlet weak var restrictDecimalsTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        restrictWhitespacesTextField.delegate = self
        restrictLettersTextField.delegate = self
        restrictDecimalsTextField.delegate = self
    }
}

// MARK: - UITextFieldDelegate
extension TextFieldsViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == restrictWhitespacesTextField {
            return string.restrictWhitespaces(in: string)
        } else if textField == restrictLettersTextField {
            return string.restrictLetters(in: string)
        } else {
            return string.restrictDecimals(in: string)
        }
    }
}



