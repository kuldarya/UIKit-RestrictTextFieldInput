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
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testStringInputRestrictWhitespaces() throws {
        let text = " "

        let result = text.isWhitespaceRestricted(in: text)

        XCTAssertFalse(result)
    }

    func testStringInputDoesntRestrictLetters() throws {
        let text = "abc"

        let result = !text.isLetterRestricted(in: text)

        XCTAssertTrue(result)
    }

    func testStringInputRestrictLetters() throws {
        let text = "abc"

        let result = text.isLetterRestricted(in: text)

        XCTAssertFalse(result)
    }

    func testStringUnputDoesntRestrictDecimals() throws {
        let text = "123"

        let result = !text.isDecimalRestricted(in: text)

        XCTAssertTrue(result)
    }

    func testStringInputRestrictDecimals() throws {
        let text = "123"

        let result = text.isDecimalRestricted(in: text)

        XCTAssertFalse(result)
    }
}
