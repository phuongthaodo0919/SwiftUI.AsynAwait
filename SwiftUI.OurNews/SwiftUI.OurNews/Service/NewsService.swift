//
//  NewsService.swift
//  SwiftUI.OurNews
//
//  Created by Salmdo on 5/21/23.
//

import Foundation

struct NewsService {
    let apiKey = "c9a4a23d08144fd9abaff86321449eda"
    
    private func getEndpoint(uri: String) -> String { "https://newsapi.org/v2\(uri)apiKey=\(apiKey)"
    }
    private func getSourceEndpoint () -> String {
        //https://newsapi.org/v2/top-headlines/sources?apiKey=c9a4a23d08144fd9abaff86321449eda
        getEndpoint(uri: "/top-headlines/sources?")
    }
    
    private func getTopHeadlineEndpoint(sourceName: String) -> String {
        //https://newsapi.org/v2/top-headlines?sources=abc-news-au&apiKey=c9a4a23d08144fd9abaff86321449eda
        getEndpoint(uri: "/top-headlines?sources=\(sourceName)&")
    }
    
    
    func fetSourceAsync() async -> Result<[Source], NetworkError> {
        guard let url = URL(string: getSourceEndpoint()) else {
            return .failure(.urlIncorrect)
        }
        guard let (data, _) = try? await URLSession.shared.data(from: url) else {
            return .failure(.noData)
        }
        guard let decodedData = try? JSONDecoder().decode(SourceResponse.self, from: data) else {
            return .failure(.decodedFailed)
        }
        return .success(decodedData.sources)
    }
    
    
    func fetchNewsBySourceAsync(sourceName: String) async throws -> [Article] {
        return try await withCheckedThrowingContinuation({ continuation in
            fetchNewsBySource(sourceName: sourceName){ result in
                switch result {
                case .success(let articles):
                    continuation.resume(returning: articles)
                case .failure(let err):
                    continuation.resume(throwing: err)
                }
            }
        })
        
    }
    
    
    func fetchSource(completion: @escaping (Result<[Source], NetworkError>) -> Void) {
        guard let url = URL(string: getSourceEndpoint()) else {
            return completion(.failure(.urlIncorrect))
        }
        
        URLSession.shared.dataTask(with: url) { data, _, err in
            guard let data, err == nil else {
                return completion(.failure(.noData))
            }
            
            do {
                let decodedData = try JSONDecoder().decode(SourceResponse.self, from: data)
                completion(.success(decodedData.sources))
            } catch {
                return completion(.failure(.decodedFailed))
            }
        }.resume()
        
    }
    func fetchNewsBySource(sourceName: String, completion: @escaping (Result<[Article], NetworkError>) -> Void) {
        guard let url = URL(string: getTopHeadlineEndpoint(sourceName: sourceName)) else {
            return completion(.failure(.urlIncorrect))
        }
        URLSession.shared.dataTask(with: url) { data, _, err in
            guard let data, err == nil else {
                return completion(.failure(.noData))
            }
            
            do {
                let decodedData = try JSONDecoder().decode(ActicleResponse.self, from: data)
                return completion(.success(decodedData.articles))
            } catch {
                return completion(.failure(.decodedFailed))
            }
        }.resume()
        
    }
}
