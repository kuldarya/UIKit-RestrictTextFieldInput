//
//  String+Utils.swift
//  UIKitRestrictingInput
//
//  Created by Darya Kuliashova on 10/05/2022.
//

import Foundation

extension String {
    func isWhitespaceRestricted(in input: Self) -> Bool {
        let invalidCharacterSet = NSCharacterSet.whitespaces
        let charSet = CharacterSet(charactersIn: input)
        return !invalidCharacterSet.isSuperset(of: charSet)
    }

    func isLetterRestricted(in input: Self) -> Bool {
        let invalidCharacterSet = NSCharacterSet.letters
        let charSet = CharacterSet(charactersIn: input)
        return !invalidCharacterSet.isSuperset(of: charSet)
    }

    func isDecimalRestricted(in input: Self) -> Bool {
        let invalidCharacterSet = NSCharacterSet.decimalDigits
        let charSet = CharacterSet(charactersIn: input)
        return !invalidCharacterSet.isSuperset(of: charSet)
    }
}
