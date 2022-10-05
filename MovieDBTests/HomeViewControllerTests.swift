//
//  HomeViewControllerTests.swift
//  MovieDBTests
//
//  Created by Ashish Bogati on 05/10/2022.
//

import XCTest
@testable import MovieDB

final class HomeViewControllerTests: XCTestCase {
    
    func test_canInit() throws {
        _ = try makeSut()
    }
    
    func test_viewDidLoad_setupViewsNavigationBar() throws {
        let sut = try makeSut()
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.title, "Home", "Navigation Title")
        XCTAssertEqual(sut.navigationItem.rightBarButtonItems?.count, 1, "Navigation right bar button")
    }
    
}

private func makeSut() throws -> HomeViewController {
    let vc = try XCTUnwrap(HomeFactory.make())
    let navigationController = try XCTUnwrap(UINavigationController(rootViewController: vc))
    let sut = try XCTUnwrap(navigationController.topViewController as? HomeViewController)
    return sut
}
