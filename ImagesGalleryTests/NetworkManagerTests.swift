//
//  NetworkManagerTests.swift
//  ImagesGalleryTests
//
//  Created by Hasan on 8/11/19.
//  Copyright © 2019 Hasan. All rights reserved.
//

import XCTest
import Alamofire

class NetworkManagerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDecoding() {
        
        if let path = Bundle(for: type(of: self)).path(forResource: "response", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let model = NetworkManager.sharedInstance.decodeModel(data: data, type: PixabayImage.self)
                XCTAssertNotNil(model)
                }
                catch {
                assert(false)
            }
        }
    }
    
    func testHttpMethodMappingGet()  {
        let result = NetworkManager.sharedInstance.alarmofireHttpMethodMapping(HttpRequestMethod.get)
        XCTAssertEqual(result, HTTPMethod.get)
    }

    func testHttpMethodMappingPost()  {
        let result = NetworkManager.sharedInstance.alarmofireHttpMethodMapping(HttpRequestMethod.post)
        XCTAssertEqual(result, HTTPMethod.post)
    }
    

}
