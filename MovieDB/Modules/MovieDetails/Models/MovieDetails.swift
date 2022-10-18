//
//  MovieDetails.swift
//  MovieDB
//
//  Created by Ashish Bogati on 07/11/2021.
//

import Foundation

struct MovieDetails: Decodable {
    var adult: Bool?
    var backdrop_path: String?
    var id: Int?
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
