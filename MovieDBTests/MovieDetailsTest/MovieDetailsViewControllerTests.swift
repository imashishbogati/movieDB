//
//  MovieDetailsViewControllerTests.swift
//  MovieDBTests
//
//  Created by Ashish Bogati on 08/10/2022.
//

import XCTest
@testable import MovieDB

final class MovieDetailsViewControllerTests: XCTestCase {
    
    func test_canInit() throws {
        _ = try makeSut()
    }
    
    func test_viewDidLoad_setupViews() throws {
        let sut = try makeSut()
        let vm = MovieDetailsViewModelStub()
        sut.viewModel = vm
        sut.loadViewIfNeeded()
        XCTAssertEqual(vm.callCount, 1)
        XCTAssertEqual(sut.overviewLabel.text, "Overview")
        XCTAssertEqual(sut.posterImageView.image, nil)
        XCTAssertEqual(sut.overViewDescriptionLabel.text, "")
    }
    
    func test_viewDidLoad_loadData_shouldLoadMovies() throws {
        let sut = try makeSut()
        let vm = MovieDetailsViewModelStub()
        sut.viewModel = vm
        sut.loadViewIfNeeded()
        vm.completion?(.success(makeMovieDetails()))
        XCTAssertEqual(vm.callCount, 1)
        XCTAssertEqual(sut.scrollView.isHidden, false)
        XCTAssertEqual(sut.navigationController?.topViewController?.contains(sut.emptyView), nil)
        XCTAssertEqual(sut.overViewDescriptionLabel.text, "test overview")
        XCTAssertEqual(sut.navigationItem.title, "test title")
    }
    
    func test_viewDidLoad_loadDataFailure_shouldShowEmptyView() throws {
        let sut = try makeSut()
        let vm = MovieDetailsViewModelStub()
        sut.viewModel = vm
        sut.loadViewIfNeeded()
        vm.completion?(.failure(.init(forRequestURL: URL(string: "https:www.dummy.com")!,
                                               errorMessage: "No Data",
                                               forStatusCode: 200)))
        XCTAssertEqual(vm.callCount, 1)
        XCTAssertEqual(sut.scrollView.isHidden, true)
        XCTAssertEqual(sut.emptyView.titleLabel.text, "No Data")
    }
    
    func test_emptyViewTapRetryButton_shouldRetry() throws {
        let sut = try makeSut()
        let vm = MovieDetailsViewModelStub()
        sut.viewModel = vm
        sut.loadViewIfNeeded()
        vm.completion?(.failure(.init(forRequestURL: URL(string: "https:www.dummy.com")!, errorMessage: "No Data", forStatusCode: 200)))
        tap(sut.emptyView.retryButton)
        XCTAssertEqual(vm.callCount, 2)
    }
}

private func makeSut() throws -> MovieDetailsViewController {
    let sut = try XCTUnwrap(MovieDetailsViewController())
    sut.castListView = CastListView(viewModel: MovieCastListViewModelStub())
    return sut
}

private func makeMovieDetails() -> MovieDetails {
    return MovieDetails(id: 1,
                        original_language: "EN",
                        original_title: "test title",
                        overview: "test overview",
                        poster_path: "",
                        title: "test title")
}



private class MovieDetailsViewModelStub: MovieDetailViewModel {
    func getMovieID() -> Int {
        return 1
    }
    
    var completion: ((Result<MovieDetails?, NetworkError>) -> Void)?
    var callCount: Int = 0
    
    func getMovieDetails(completion: @escaping (Result<MovieDetails?, NetworkError>) -> Void) {
        callCount += 1
        self.completion = completion
    }
}

private class MovieCastListViewModelStub: CastViewModel {
    func getMovieCast(completion: @escaping (Result<MovieDB.Person?, MovieDB.NetworkError>) -> Void) {
        
    }
    
    
}
