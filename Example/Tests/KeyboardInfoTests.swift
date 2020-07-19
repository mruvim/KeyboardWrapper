import UIKit
import XCTest
import KeyboardWrapper

class KeyboardInfoTests: XCTestCase {

    func testAnimationCurve() {
        let expectedCurves: [UIView.AnimationCurve] = [.easeInOut, .easeIn, .easeOut, .linear]

        let curves = expectedCurves.map { c in
            KeyboardInfo(info: [UIResponder.keyboardAnimationCurveUserInfoKey: c.rawValue], state: .willShow).animationCurve
        }
        XCTAssertEqual(curves, expectedCurves)
    }

    func testAnimationOptions() {
        let curves: [UIView.AnimationCurve] = [.easeInOut, .easeIn, .easeOut, .linear]

        let options = curves.map { c in
            KeyboardInfo(info: [UIResponder.keyboardAnimationCurveUserInfoKey: c.rawValue], state: .willShow).animationOptions
        }
        XCTAssertEqual(options, [.curveEaseInOut, .curveEaseIn, .curveEaseOut, .curveLinear])
    }

    func testAnimationOptionsWithHiddenAnimationCurveCase() {
        let curves: [UIView.AnimationCurve] = [.easeInOut, .easeIn, .easeOut, .linear]
        let rawCurves: [Int] = curves.map({ $0.rawValue }) + [7]

        let options = rawCurves.map { c in
            KeyboardInfo(info: [UIResponder.keyboardAnimationCurveUserInfoKey: c], state: .willShow).animationOptions
        }
        XCTAssertEqual(options, [.curveEaseInOut, .curveEaseIn, .curveEaseOut, .curveLinear, .curveEaseInOut])
    }
}
