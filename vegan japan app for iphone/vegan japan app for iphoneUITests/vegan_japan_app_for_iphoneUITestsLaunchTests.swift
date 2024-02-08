//
//  vegan_japan_app_for_iphoneUITestsLaunchTests.swift
//  vegan japan app for iphoneUITests
//
//  Created by XIAOYU ZHANG on 2024/02/12.
//

import XCTest

final class vegan_japan_app_for_iphoneUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
