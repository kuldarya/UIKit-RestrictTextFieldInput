//
//  UIKitRestrictingInputTests.swift
//  UIKitRestrictingInputTests
//
//  Created by Darya Kuliashova on 06/05/2022.
//

import XCTest
@testable import UIKitRestrictingInput

class UIKitRestrictingInputTests: XCTestCase {
    var sut: TextFieldsViewController!

    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "TextFieldsViewController") as? TextFieldsViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    ///  Check first that the UITextFields are connected to their IBOutlets.
    func testTextFieldsAreConnectedWhenLoaded() throws {
        _ = try XCTUnwrap(sut.restrictWhitespacesTextField, "The text field restricting whitespaces is not connected")
        _ = try XCTUnwrap(sut.restrictLettersTextField, "The text field restricting letters is not connected")
        _ = try XCTUnwrap(sut.restrictDecimalsTextField, "The text field restricting decimal numbers is not connected")
    }

    /// Test that the first input field (restrictWhitespacesTextField) restricts whitespaces.
    func testRestrictWhitespacesTextField_RestrictsWhitespaces() throws {
        let restrictWhitespacesTextField = try XCTUnwrap(sut.restrictWhitespacesTextField, "The text field restricting whitespaces is not connected")
        restrictWhitespacesTextField.text = " "

        guard let result = restrictWhitespacesTextField.delegate?.textField?(restrictWhitespacesTextField,
                                                                             shouldChangeCharactersIn: NSRange(location: 0, length: 1),
                                                                             replacementString: restrictWhitespacesTextField.text ?? "") else { return }
        XCTAssertFalse(result)
    }

    /// Test that the first input field (restrictWhitespacesTextField) allows letters.
    func testRestrictWhitespacesTextField_AllowsLetters() throws {
        let restrictWhitespacesTextField = try XCTUnwrap(sut.restrictWhitespacesTextField, "The text field restricting whitespaces is not connected")
        restrictWhitespacesTextField.text = "a"

        guard let result = restrictWhitespacesTextField.delegate?.textField?(restrictWhitespacesTextField,
                                                                             shouldChangeCharactersIn: NSRange(location: 0, length: 1),
                                                                             replacementString: restrictWhitespacesTextField.text ?? "") else { return }
        XCTAssertTrue(result)
    }

    /// Test that the second input field (restrictLettersTextField) restricts letters.
    func testRestrictLettersTextField_RestrictsLetters() throws {
        let restrictLettersTextField = try XCTUnwrap(sut.restrictLettersTextField, "The text field restricting letters is not connected")
        restrictLettersTextField.text = "a"

        guard let result = restrictLettersTextField.delegate?.textField?(restrictLettersTextField,
                                                                         shouldChangeCharactersIn: NSRange(location: 0, length: 1),
                                                                         replacementString: restrictLettersTextField.text ?? "") else { return }
        XCTAssertFalse(result)
    }

    /// Test that the second input field (restrictLettersTextField) allows whitespaces.
    func testRestrictLettersTextField_AllowsWhitespaces() throws {
        let restrictLettersTextField = try XCTUnwrap(sut.restrictLettersTextField, "The text field restricting letters is not connected")
        restrictLettersTextField.text = " "

        guard let result = restrictLettersTextField.delegate?.textField?(restrictLettersTextField,
                                                                         shouldChangeCharactersIn: NSRange(location: 0, length: 1),
                                                                         replacementString: restrictLettersTextField.text ?? "") else { return }
        XCTAssertTrue(result)
    }
}
