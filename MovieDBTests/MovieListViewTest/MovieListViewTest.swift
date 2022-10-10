//
//  TestListView.swift
//  MovieDBTests
//
//  Created by Ashish Bogati on 05/10/2022.
//

import XCTest
import ViewControllerPresentationSpy
@testable import MovieDB

final class MovieListViewTest: XCTestCase {
    
    func test_canInit() throws {
        _ = try makeSut()
    }
    
    func test_headLabelWithFakesViewModel_shouldBeTest() throws {
        let vm = ListViewModelStubs()
        let sut = try makeSut(viewModel: vm)
        XCTAssertEqual(sut.headingLabel.text, "test")
    }
    
    func test_collectionView_initalSetup() throws {
        let sut = try makeSut()
        XCTAssertNotNil(sut.collectionView.delegate, "Delegate")
        XCTAssertNotNil(sut.collectionView.dataSource, "Datasource")
        XCTAssertEqual(sut.numberOfItemsInList(for: 0), 0)
    }
    
    func test_viewAllButtonTitle_shouldBeViewAll() throws {
        let sut = try makeSut()
        XCTAssertEqual(sut.viewAllButton.titleLabel?.text, "View all")
    }
    
    
    func test_loadData_withMovieResponse_numberOfItemShouldBeOne() throws {
        let vm = ListViewModelStubs()
        let sut = try makeSut(viewModel: vm,
                              listType: .trending)
        XCTAssertEqual(sut.numberOfItemsInList(for: 0), 1)
        let cell = sut.listCell(for: 0)
        XCTAssertEqual(cell?.titleLabel.text, "Test Orginal title")
    }
    
}

extension MovieListView {
    var selectedSection: Int { 0 }
    
    func numberOfItemsInList(for row: Int) -> Int? {
        return collectionView.numberOfItems(inSection: selectedSection)
    }
    
    func listCell(for row: Int) -> ListCollectionViewCell? {
        let indexPath = IndexPath(row: row, section: selectedSection)
        return collectionView.dataSource?.collectionView(collectionView, cellForItemAt: indexPath) as? ListCollectionViewCell
    }
}

private func makeSut(viewModel: MovieListViewModelInterface = ListViewModelSpy(),
                     listType: MovieListType = .trending) throws -> MovieListView {
    let listView = MovieListView(viewModel: viewModel,
                                 listType: listType)
    return try XCTUnwrap(listView)
}

private func makeMovieResult() -> Results {
    return Results(adult: false,
                   backdrop_path: "/sbS8e0XBqSeNhJi3Ej1phqVnGCy.jpg",
                   id: 1,
                   original_language: "en",
                   original_title: "Test Orginal title",
                   overview: "test overviews",
                   popularity: 105.371,
                   poster_path: "/gPn9e8eP7TeKQU4IeWAMzOajR40.jpg",
                   release_date: "2022-10-05",
                   title: "Test title",
                   video: false,
                   vote_average: 7.109,
                   vote_count: 32)
}

private func makeMovieResponse() -> MovieListResponse {
    return MovieListResponse(page: 1,
                             results: [makeMovieResult()])
}

private class ListViewModelSpy: MovieListViewModelInterface {
    func getMovies(request: MovieListRequest,
                   completion: @escaping (Result<MovieListResponse, NetworkError>) -> Void) {
        
    }
    
    func listTitle(list: MovieDB.MovieListType) -> String {
        return "test"
    }
}

private class ListViewModelStubs: MovieListViewModelInterface {
    
    func getMovies(request: MovieListRequest,
                   completion: @escaping (Result<MovieListResponse, NetworkError>) -> Void) {
        completion(.success(makeMovieResponse()))
    }
    
    func listTitle(list: MovieDB.MovieListType) -> String {
        return "test"
    }
}
