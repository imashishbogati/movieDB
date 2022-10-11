//
//  CastListViewTest.swift
//  MovieDBTests
//
//  Created by Ashish Bogati on 10/10/2022.
//

import XCTest
@testable import MovieDB

final class CastListViewTest: XCTestCase {
    func test_canInit() throws {
        _ = try makeSut()
    }
    
    func test_headingLabel_shouldBeEmpty() throws {
        let sut = try makeSut()
        XCTAssertEqual(sut.headingLabel.text, "")
    }
    
    func test_collectionView_initalSetup() throws {
        let sut = try makeSut()
        XCTAssertNotNil(sut.collectionView.delegate, "Delegage")
        XCTAssertNotNil(sut.collectionView.dataSource, "Datasource")
        XCTAssertEqual(sut.numberOfItemsInList(for: 0), 0)
    }
    
    func test_getListWithViewModelStb_shouldExecuteOnce() throws {
        let vm = MovieCastListViewModelStub()
        _ = try makeSut(viewModel: vm)
        XCTAssertEqual(vm.callCount, 1)
    }
    
    func test_getListWithValidResponse_shouldRenderList() throws {
        let vm = MovieCastListViewModelStub()
        let sut = try makeSut(viewModel: vm)
        vm.completion?(.success(makePerson(id: 1)))
        XCTAssertEqual(sut.numberOfItemsInList(for: 0), 1)
    }
    
    func test_getListWithValidResponse_shouldRenderListCell() throws {
        let vm = MovieCastListViewModelStub()
        let sut = try makeSut(viewModel: vm)
        vm.completion?(.success(makePerson(id: 1)))
        XCTAssertEqual(sut.numberOfItemsInList(for: 0), 1)
        let cell = sut.castCell(for: 0)
        XCTAssertEqual(cell?.titleLabel.text, "DUMMY")
    }
    
    
    func test_getListWithFailureResponse_shouldNotRenderList() throws {
        let vm = MovieCastListViewModelStub()
        let sut = try makeSut(viewModel: vm)
        vm.completion?(.failure(.noData))
        XCTAssertEqual(sut.numberOfItemsInList(for: 0), 0)
    }
}

extension CastListView {
    var selectedSection: Int { 0 }
    
    func numberOfItemsInList(for row: Int) -> Int? {
        return collectionView.numberOfItems(inSection: selectedSection)
    }
    
    func castCell(for row: Int) -> CastCollectionViewCell? {
        let indexPath = IndexPath(row: row, section: selectedSection)
        return collectionView.dataSource?.collectionView(collectionView, cellForItemAt: indexPath) as? CastCollectionViewCell
    }
}

private func makeSut(viewModel: CastListViewModelInterface = MovieCastListViewModelSpy()) throws -> CastListView {
    let sut = try XCTUnwrap(CastListView(viewModel: viewModel))
    return sut
}

private func makeCast() -> Cast {
    return Cast(name: "DUMMY Name",
                original_name: "DUMMY",
                profile_path: "")
}

private func makePerson(id: Int) -> Person {
    return Person(id: id, cast: [makeCast()])
}

private class MovieCastListViewModelSpy: CastListViewModelInterface {
    
    func getMovieCast(completion: @escaping (Result<Person, NetworkError>) -> Void) {
        
    }
}

private class MovieCastListViewModelStub: CastListViewModelInterface {
    
    var callCount: Int = 0
    var completion: ((Result<Person, NetworkError>) -> Void)?
    
    func getMovieCast(completion: @escaping (Result<Person, NetworkError>) -> Void) {
        callCount += 1
        self.completion = completion
    }
    
    
}
