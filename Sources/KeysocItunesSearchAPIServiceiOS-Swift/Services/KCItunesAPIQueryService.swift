//
//  KCItunesAPIQueryService.swift
//  
//
//  Created by Vanson Leung on 12/9/2023.
//

import Foundation

public class KCITunesAPIQueryService {
    private let baseURL = KCItunesConstants.shared.baseURL

    public static var shared: KCITunesAPIQueryService {
        return KCITunesAPIQueryService()
    }

    /// Runs iTunes search API for songs
    ///
    /// - Parameters:
    ///   - withQuery query: `String`,
    ///   - limit: list limit,
    ///   - offset: list / page offset,
    ///   - mediaType: `String?`, refer to `KCITunesParamMediaType`
    ///   - country: `String?`, refer to `KCITunesParamCountry`
    ///   - lang: `String?`, refer to `KCITunesParamLang`
    ///   - completion: Callback of `KCItunesSong` list array, or any network error
    ///
    /// - Usage example:
    ///
    /// ```swift
    /// KCITunesAPIQueryService.shared.searchSongs(
    ///     withQuery: "Alex",
    ///     limit: 10,
    ///     offset: page * 10,
    ///     mediaType: "podcast",
    ///     country: "US",
    ///     lang: "en_us"
    /// ) { [weak self] result in
    ///     switch result {
    ///         case .success(let songs):
    ///         ...
    ///         case .failure(let error):
    ///         ...
    ///     }
    /// }
    /// ```
    public func searchSongs(
        withQuery query: String,
        limit: Int = 10,
        offset: Int = 0,
        mediaType: String? = nil,
        country: String? = nil,
        lang: String? = nil,
        completion: @escaping (Result<[KCItunesSong], Error>) -> Void) {
        
            // Construct the URL with query parameters
            var components = URLComponents(string: baseURL)
            components?.queryItems = [
                URLQueryItem(name: "term", value: query.trimmingCharacters(in: .whitespacesAndNewlines)),
                URLQueryItem(name: "limit", value: "\(limit)"),
                URLQueryItem(name: "offset", value: "\(offset)"),
                URLQueryItem(name: "entity", value: "musicTrack"),
            ]
            
            if let e = mediaType?.trimmingCharacters(in: .whitespacesAndNewlines) { components?.queryItems?.append(URLQueryItem(name: "media", value: e)) }
            if let e = country?.trimmingCharacters(in: .whitespacesAndNewlines) { components?.queryItems?.append(URLQueryItem(name: "country", value: e)) }
            if let e = lang?.trimmingCharacters(in: .whitespacesAndNewlines) { components?.queryItems?.append(URLQueryItem(name: "lang", value: e)) }

            guard let url = components?.url else {
                completion(.failure(KCItunesConstants.NetworkError.invalidURL))
                return
            }

            // Create and configure the URL request
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            print(request.url?.absoluteString ?? "")
            
            KCITunesAPINetworkService.shared.performRequest(request, decodingType: KCItunesAPIResponse<KCItunesSong>.self) { result in
                switch result {
                case .success(let songsResponse):
                    completion(.success(songsResponse.results))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    


    /// Runs iTunes search API for albums
    ///
    /// - Parameters:
    ///   - withQuery query: `String`,
    ///   - limit: list limit,
    ///   - offset: list / page offset,
    ///   - mediaType: `String?`, refer to `KCITunesParamMediaType`
    ///   - country: `String?`, refer to `KCITunesParamCountry`
    ///   - lang: `String?`, refer to `KCITunesParamLang`
    ///   - completion: Callback of `KCItunesSong` list array, or any network error
    ///
    /// - Usage example:
    ///
    /// ```swift
    /// KCITunesAPIQueryService.shared.searchAlbums(
    ///     withQuery: "Alex",
    ///     limit: 10,
    ///     offset: page * 10,
    ///     mediaType: "podcast",
    ///     country: "US",
    ///     lang: "en_us"
    /// ) { [weak self] result in
    ///     switch result {
    ///         case .success(let albums):
    ///         ...
    ///         case .failure(let error):
    ///         ...
    ///     }
    /// }
    /// ```
    public func searchAlbums(
        withQuery query: String,
        limit: Int = 10,
        offset: Int = 0,
        mediaType: String? = nil,
        country: String? = nil,
        lang: String? = nil,
        completion: @escaping (Result<[KCItunesAlbum], Error>) -> Void) {
        
            // Construct the URL with query parameters
            var components = URLComponents(string: baseURL)
            components?.queryItems = [
                URLQueryItem(name: "term", value: query.trimmingCharacters(in: .whitespacesAndNewlines)),
                URLQueryItem(name: "limit", value: "\(limit)"),
                URLQueryItem(name: "offset", value: "\(offset)"),
                URLQueryItem(name: "entity", value: "album"),
            ]

            if let e = mediaType?.trimmingCharacters(in: .whitespacesAndNewlines) { components?.queryItems?.append(URLQueryItem(name: "media", value: e)) }
            if let e = country?.trimmingCharacters(in: .whitespacesAndNewlines) { components?.queryItems?.append(URLQueryItem(name: "country", value: e)) }
            if let e = lang?.trimmingCharacters(in: .whitespacesAndNewlines) { components?.queryItems?.append(URLQueryItem(name: "lang", value: e)) }

            guard let url = components?.url else {
                completion(.failure(KCItunesConstants.NetworkError.invalidURL))
                return
            }

            // Create and configure the URL request
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            print(request.url?.absoluteString ?? "")

            KCITunesAPINetworkService.shared.performRequest(request, decodingType: KCItunesAPIResponse<KCItunesAlbum>.self) { result in
                switch result {
                case .success(let songsResponse):
                    completion(.success(songsResponse.results))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    


    /// Runs iTunes search API for artists
    ///
    /// - Parameters:
    ///   - withQuery query: `String`,
    ///   - limit: list limit,
    ///   - offset: list / page offset,
    ///   - mediaType: `String?`, refer to `KCITunesParamMediaType`
    ///   - country: `String?`, refer to `KCITunesParamCountry`
    ///   - lang: `String?`, refer to `KCITunesParamLang`
    ///   - completion: Callback of `KCItunesSong` list array, or any network error
    ///
    /// - Usage example:
    ///
    /// ```swift
    /// KCITunesAPIQueryService.shared.searchArtists(
    ///     withQuery: "Alex",
    ///     limit: 10,
    ///     offset: page * 10,
    ///     mediaType: "podcast",
    ///     country: "US",
    ///     lang: "en_us"
    /// ) { [weak self] result in
    ///     switch result {
    ///         case .success(let songs):
    ///         ...
    ///         case .failure(let error):
    ///         ...
    ///     }
    /// }
    /// ```
    public func searchArtists(
        withQuery query: String,
        limit: Int = 10,
        offset: Int = 0,
        mediaType: String? = nil,
        country: String? = nil,
        lang: String? = nil,
        completion: @escaping (Result<[KCItunesArtist], Error>) -> Void) {
        
            // Construct the URL with query parameters
            var components = URLComponents(string: baseURL)
            components?.queryItems = [
                URLQueryItem(name: "term", value: query.trimmingCharacters(in: .whitespacesAndNewlines)),
                URLQueryItem(name: "limit", value: "\(limit)"),
                URLQueryItem(name: "offset", value: "\(offset)"),
                URLQueryItem(name: "entity", value: "musicArtist"),
            ]

            if let e = mediaType?.trimmingCharacters(in: .whitespacesAndNewlines) { components?.queryItems?.append(URLQueryItem(name: "media", value: e)) }
            if let e = country?.trimmingCharacters(in: .whitespacesAndNewlines) { components?.queryItems?.append(URLQueryItem(name: "country", value: e)) }
            if let e = lang?.trimmingCharacters(in: .whitespacesAndNewlines) { components?.queryItems?.append(URLQueryItem(name: "lang", value: e)) }

            guard let url = components?.url else {
                completion(.failure(KCItunesConstants.NetworkError.invalidURL))
                return
            }

            // Create and configure the URL request
            var request = URLRequest(url: url)
            request.httpMethod = "GET"

            KCITunesAPINetworkService.shared.performRequest(request, decodingType: KCItunesAPIResponse<KCItunesArtist>.self) { result in
                switch result {
                case .success(let songsResponse):
                    completion(.success(songsResponse.results))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}


// Define a wrapper struct to match the top-level JSON structure
private struct KCItunesAPIResponse<T: Codable>: Codable {
    let resultCount: Int
    let results: [T]
}
