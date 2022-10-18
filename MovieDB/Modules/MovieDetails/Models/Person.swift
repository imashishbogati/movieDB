//
//  Person.swift
//  MovieDB
//
//  Created by Ashish Bogati on 07/11/2021.
//

import Foundation

struct Person: Decodable {
    var id: Int?
    var cast: [Cast] = []
}

struct Cast: Decodable {
    var name: String?
    var original_name: String?
    var profile_path: String?
}
