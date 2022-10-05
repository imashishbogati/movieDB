//
//  TestListView.swift
//  MovieDBTests
//
//  Created by Ashish Bogati on 05/10/2022.
//

import XCTest
@testable import MovieDB

final class TestListView: XCTestCase {
    
    func test_canInit() throws {
        _ = try makeSut()
    }
    
    func test_headLabelWithDummyViewModel_shouldBeEmptyString() throws {
        let sut = try makeSut()
        sut.listType(listType: .popular)
        XCTAssertEqual(sut.headingLabel.text, "")
    }
    
    func test_headLabelWithFakesViewModel_shouldBePopular() throws {
        let sut = try makeSut()
        let viewModel = ListViewModelFakes()
        sut.viewModel = viewModel
        sut.listType(listType: .popular)
        XCTAssertEqual(sut.headingLabel.text, "test")
    }
    
    func test_viewAllButtonTitle_shouldBeViewAll() throws {
        let sut = try makeSut()
        XCTAssertEqual(sut.viewAllButton.titleLabel?.text, "View all")
    }
    
    func test_collectionView_initalSetup() throws {
        let sut = try makeSut()
        XCTAssertNotNil(sut.collectionView.delegate, "Delegate")
        XCTAssertNotNil(sut.collectionView.dataSource, "Datasource")
        XCTAssertEqual(sut.numberOfItemsInList(for: 0), 0)
    }
}

extension ListView {
    var selectedSection: Int { 0 }
    
    func numberOfItemsInList(for row: Int) -> Int? {
        return collectionView.numberOfItems(inSection: selectedSection)
    }
}

private func makeSut() throws -> ListView {
    let listView = ListView()
    listView.viewModel = ListViewModelDummy()
    return try XCTUnwrap(listView)
}


private class ListViewModelDummy: MovieListViewModelInterface {
    func listTitle(list: MovieDB.ListType) -> String {
        return ""
    }
}


private class ListViewModelFakes: MovieListViewModelInterface {
    func listTitle(list: MovieDB.ListType) -> String {
        return "test"
    }
}
