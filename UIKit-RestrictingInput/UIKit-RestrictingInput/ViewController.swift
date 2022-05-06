//
//  ViewController.swift
//  UIKit-RestrictingInput
//
//  Created by Darya Kuliashova on 06/05/2022.
//

import UIKit

final class ViewController: UIViewController {
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
extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == restrictWhitespacesTextField {
            let invalidCharacterSet = NSCharacterSet.whitespaces
            let charSet = CharacterSet(charactersIn: string)
            return !invalidCharacterSet.isSuperset(of: charSet)
        } else if textField == restrictLettersTextField {
            let invalidCharacterSet = NSCharacterSet.letters
            let charSet = CharacterSet(charactersIn: string)
            return !invalidCharacterSet.isSuperset(of: charSet)
        } else {
            let invalidCharacterSet = NSCharacterSet.decimalDigits
            let charSet = CharacterSet(charactersIn: string)
            return !invalidCharacterSet.isSuperset(of: charSet)
        }
    }
}



