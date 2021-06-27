//
//  MockApiCall.swift
//  EGYMTests
//
//  Created by sabaz shereef on 25/06/21.
//

import Foundation
@testable import EGYM

class MockApiCall: apiFunctionsProtocol {
    func fetchingDataFromApi(completion: @escaping (Result<ApiResponse, Error>) -> Void) {
      
        guard let url = Bundle(for: MockApiCall.self).url(forResource: "TopStoriesListMock", withExtension: "json") else {
          //  completion(.failure(Error.self as! Error))
            return

        }
            do{
               
                let data = try Data(contentsOf:  url)
                
                let result = try JSONDecoder().decode(ApiResponse.self, from: data)
                
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
                print("errror")

                
            }
        }
    }
    
    
    
    
    

