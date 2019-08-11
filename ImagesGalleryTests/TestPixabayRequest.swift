//
//  TestPixabayRequest.swift
//  ImagesGalleryTests
//
//  Created by Hasan on 8/11/19.
//  Copyright © 2019 Hasan. All rights reserved.
//

import XCTest

class TestPixabayRequest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRequestCreation() {
        let request = PixabayRequest(paramters: nil)
        XCTAssertNotNil(request)
    }
    
    func testRequestHasUrl() {
        let request = PixabayRequest(paramters: nil)
        XCTAssertNotNil(request.url)
    }
    
    func testRequestHasApiKey() {
        let request = PixabayRequest(paramters: nil)
        XCTAssertNotNil(request.paramters?["key"])
    }

}
