//
//  TMDBSearchMovieResponse.swift
//  TheMovieDbAPIClient
//
//  Created by Desimini, Wilson on 9/29/21.
//

import Foundation

public struct TMDBSearchMovieResponse: Codable {
    public let page: Int
    public let results: [TMDBMovieSearchResult]
    public let totalPages: Int
    public let totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages
        case totalResults
    }

    init(
        page: Int,
        results: [TMDBMovieSearchResult],
        totalPages: Int,
        totalResults: Int
    ) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}

extension TMDBSearchMovieResponse {
    public struct TMDBMovieSearchResult: Codable {
        public let adult: Bool
        public let backdropPath: String?
        public let genreIds: [Int]
        public let id: Int
        public let overview: String
        public let originalTitle: String
        public let popularity: Double
        public let posterPath: String?
        public let releaseDate: String
        public let title: String
        public let voteAverage: Double
        public let video: Bool
        public let voteCount: Int
        
        enum CodingKeys: String, CodingKey {
            case adult
            case backdropPath
            case genreIds
            case id
            case overview
            case originalTitle
            case popularity
            case posterPath
            case releaseDate
            case title
            case voteAverage
            case video
            case voteCount
        }

        init(
            adult: Bool,
            backdropPath: String?,
            genreIds: [Int],
            id: Int,
            overview: String,
            originalTitle: String,
            popularity: Double,
            posterPath: String?,
            releaseDate: String,
            title: String,
            voteAverage: Double,
            video: Bool,
            voteCount: Int
        ) {
            self.adult = adult
            self.backdropPath = backdropPath
            self.genreIds = genreIds
            self.id = id
            self.overview = overview
            self.originalTitle = originalTitle
            self.popularity = popularity
            self.posterPath = posterPath
            self.releaseDate = releaseDate
            self.title = title
            self.voteAverage = voteAverage
            self.video = video
            self.voteCount = voteCount
        }
    }
}
