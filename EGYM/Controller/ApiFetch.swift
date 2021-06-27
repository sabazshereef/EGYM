//
//  ApiFetch.swift
//  EGYM
//
//  Created by sabaz shereef on 27/06/21.
//

import Foundation

protocol apiFunctionsProtocol {
    func fetchingDataFromApi(completion: @escaping(Result<ApiResponse,Error>) -> Void)
}

class ApiFetch: apiFunctionsProtocol {
    
    static let shared = ApiFetch()
    
    func fetchingDataFromApi(completion: @escaping(Result<ApiResponse,Error>) -> Void) {
        
        guard let upcomingEventsUrl = URL(string: "https://api.nytimes.com/svc/topstories/v2/home.json?api-key=Qjbt8kkS5dGyDGL87hoSeKyvfwIOZiZb") else { fatalError() }
        
        let dataTask = URLSession.shared.dataTask(with: upcomingEventsUrl) { data,_,_ in
            
            guard let jsonData = data else { return }
            do{
                let decoder = try JSONDecoder().decode(ApiResponse.self, from: jsonData)
                completion(.success(decoder))
            }
            catch (let error){
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
}
