//
//  MovieListResponse.swift
//  MovieDB
//
//  Created by Ashish Bogati on 05/10/2022.
//

import Foundation

// MARK: - MovieListResponse

struct MovieListResponse: Decodable {
    var page: Int?
    var results: [Results] = []
}

struct Results: Decodable {
    var adult: Bool?
    var backdrop_path: String?
    var id: Int?
    var genre_ids: [Int] = []
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity: Double?
    var poster_path: String?
    var release_date: String?
    var title: String?
    var video: Bool?
    var vote_average: Double?
    var vote_count: Int?
}
