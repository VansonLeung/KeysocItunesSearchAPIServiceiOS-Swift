//
//  KCITunesAPINetworkService.swift
//  
//
//  Created by Vanson Leung on 12/9/2023.
//

import Foundation

class KCITunesAPINetworkService {
    static let shared = KCITunesAPINetworkService()

    private init() {}

    func performRequest<T: Codable>(
        _ request: URLRequest,
        decodingType: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(KCItunesConstants.NetworkError.noData))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let decodedData = try decoder.decode(decodingType, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    
    @available(macOS 10.15, *)
    func performRequestAsync<T: Codable>(
        _ request: URLRequest,
        decodingType: T.Type
    ) async throws -> T {
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            let decodedData = try decoder.decode(decodingType, from: data)
            return decodedData
        } catch {
            throw error
        }
    }


}
