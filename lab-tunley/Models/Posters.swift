//
//  Posters.swift
//  lab-tunley
//
//  Created by Delch Enterprises on 10/1/23.
//

import Foundation

struct PostersResponse: Decodable {
    let results: [Poster]
}

struct Poster: Decodable {
    let poster_path: String
    let baseURL=URL(string: "https://image.tmdb.org/t/p/original/")}
