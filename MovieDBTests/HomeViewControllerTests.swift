//
//  HomeViewControllerTests.swift
//  MovieDBTests
//
//  Created by Ashish Bogati on 05/10/2022.
//

import XCTest
import ViewControllerPresentationSpy
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
    
    func test_movieListView_delegates_shouldNotBeNil() throws {
        let sut = try makeSut()
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.trendingMovieListView.delegate)
    }
    
    func test_movieListView_delegateMethodDidFailed_shouldShowAlert() throws {
        let sut = try makeSut()
        sut.loadViewIfNeeded()
        sut.didFailed(error: .noData)
        XCTAssertEqual(sut.scrollView.isHidden, true)
        XCTAssertEqual(sut.navigationController?.topViewController?.contains(sut.emptyView), true)
    }
    
    func test_movieListView_delegateMethodErrorNil_shouldShowContent() throws {
        let sut = try makeSut()
        sut.loadViewIfNeeded()
        sut.didFailed(error: nil)
        XCTAssertEqual(sut.scrollView.isHidden, false)
        XCTAssertEqual(sut.navigationController?.topViewController?.contains(sut.emptyView), false)
    }
    
    func test_movieListTap_shouldPushDetailsVC() throws {
        let sut = try makeSut()
        sut.loadViewIfNeeded()
        sut.trendingMovieListView.listType(listType: .trending)
        sut.didTapMovie(movieID: 1)
        executeRunLoop()
        XCTAssertEqual(sut.navigationController?.viewControllers.count, 2)
    }
    
}

extension HomeViewController {
    func didFailed(error: NetworkError) {
        trendingMovieListView.delegate?.didFailed(error: error)
    }
    
    func didTapMovie(movieID: Int) {
        trendingMovieListView.delegate?.didTapMovie(movieID: movieID)
    }
}

private func makeSut() throws -> HomeViewController {
    let vc = try XCTUnwrap(HomeFactory.make())
    let navigationController = try XCTUnwrap(UINavigationController(rootViewController: vc))
    let sut = try XCTUnwrap(navigationController.topViewController as? HomeViewController)
    return sut
}
