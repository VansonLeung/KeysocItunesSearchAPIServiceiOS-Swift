//
//  File.swift
//  
//
//  Created by Vanson Leung on 20/9/2023.
//

import Foundation

@available(macOS 10.15, *)
public class KCITunesAPIQueryServiceAsync {
    private let baseURL = KCItunesConstants.shared.baseURL

    public static var shared: KCITunesAPIQueryServiceAsync {
        return KCITunesAPIQueryServiceAsync()
    }

    /// [Concurrency] Runs iTunes search API for songs
    ///
    /// - Parameters:
    ///   - withQuery query: `String`,
    ///   - limit: list limit,
    ///   - offset: list / page offset,
    ///   - mediaType: `String?`, refer to `KCITunesParamMediaType`
    ///   - country: `String?`, refer to `KCITunesParamCountry`
    ///   - lang: `String?`, refer to `KCITunesParamLang`
    ///
    /// - Returns:
    ///   - list of song item:[ KCItunesSong]
    ///
    ///
    /// - Usage example:
    ///
    /// ```swift
    /// do {
    ///   let items = try await KCITunesAPIQueryServiceAsync.shared.searchSongs(
    ///     withQuery: "Alex",
    ///     limit: 10,
    ///     offset: page * 10,
    ///     mediaType: "podcast",
    ///     country: "US",
    ///     lang: "en_us"
    ///   )
    ///   ...
    /// } catch {
    ///   ...
    /// }
    /// ```
    ///
    public func searchSongs(
        withQuery query: String,
        limit: Int = 10,
        offset: Int = 0,
        mediaType: String? = nil,
        country: String? = nil,
        lang: String? = nil) async throws -> [KCItunesSong] {

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
                throw KCItunesConstants.NetworkError.invalidURL
            }

            // Create and configure the URL request
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            print(request.url?.absoluteString ?? "")
            
            do {
                let result = try await KCITunesAPINetworkService.shared.performRequestAsync(request, decodingType: KCItunesAPIResponse<KCItunesSong>.self)
                return result.results
            } catch {
                throw error
            }
    }
    


    /// [Concurrency] Runs iTunes search API for albums
    ///
    /// - Parameters:
    ///   - withQuery query: `String`,
    ///   - limit: list limit,
    ///   - offset: list / page offset,
    ///   - mediaType: `String?`, refer to `KCITunesParamMediaType`
    ///   - country: `String?`, refer to `KCITunesParamCountry`
    ///   - lang: `String?`, refer to `KCITunesParamLang`
    ///
    /// - Returns:
    ///   - list of song item:[ KCItunesAlbums]
    ///
    ///
    /// - Usage example:
    ///
    /// ```swift
    /// do {
    ///   let items = try await KCITunesAPIQueryServiceAsync.shared.searchAlbumss(
    ///     withQuery: "Alex",
    ///     limit: 10,
    ///     offset: page * 10,
    ///     mediaType: "podcast",
    ///     country: "US",
    ///     lang: "en_us"
    ///   )
    ///   ...
    /// } catch {
    ///   ...
    /// }
    /// ```
    public func searchAlbums(
        withQuery query: String,
        limit: Int = 10,
        offset: Int = 0,
        mediaType: String? = nil,
        country: String? = nil,
        lang: String? = nil) async throws -> [KCItunesAlbum] {

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
                throw KCItunesConstants.NetworkError.invalidURL
            }

            // Create and configure the URL request
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            print(request.url?.absoluteString ?? "")
            
            do {
                let result = try await KCITunesAPINetworkService.shared.performRequestAsync(request, decodingType: KCItunesAPIResponse<KCItunesAlbum>.self)
                return result.results
            } catch {
                throw error
            }
    }
    


    /// [Concurrency] Runs iTunes search API for artists
    ///
    /// - Parameters:
    ///   - withQuery query: `String`,
    ///   - limit: list limit,
    ///   - offset: list / page offset,
    ///   - mediaType: `String?`, refer to `KCITunesParamMediaType`
    ///   - country: `String?`, refer to `KCITunesParamCountry`
    ///   - lang: `String?`, refer to `KCITunesParamLang`
    ///
    /// - Returns:
    ///   - list of song item:[ KCItunesArtist]
    ///
    ///
    /// - Usage example:
    ///
    /// ```swift
    /// do {
    ///   let items = try await KCITunesAPIQueryServiceAsync.shared.searchArtists(
    ///     withQuery: "Alex",
    ///     limit: 10,
    ///     offset: page * 10,
    ///     mediaType: "podcast",
    ///     country: "US",
    ///     lang: "en_us"
    ///   )
    ///   ...
    /// } catch {
    ///   ...
    /// }
    /// ```
    public func searchArtists(
        withQuery query: String,
        limit: Int = 10,
        offset: Int = 0,
        mediaType: String? = nil,
        country: String? = nil,
        lang: String? = nil) async throws -> [KCItunesArtist] {
            
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
                throw KCItunesConstants.NetworkError.invalidURL
            }

            // Create and configure the URL request
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            print(request.url?.absoluteString ?? "")
            
            do {
                let result = try await KCITunesAPINetworkService.shared.performRequestAsync(request, decodingType: KCItunesAPIResponse<KCItunesArtist>.self)
                return result.results
            } catch {
                throw error
            }
    }
}


// Define a wrapper struct to match the top-level JSON structure
private struct KCItunesAPIResponse<T: Codable>: Codable {
    let resultCount: Int
    let results: [T]
}
