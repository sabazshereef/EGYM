//
//  TopStoriesViewModel.swift
//  EGYM
//
//  Created by sabaz shereef on 27/06/21.
//

import Foundation

struct TopStoriesViewModel {

    weak var dataSource : GenericDataSource<ResultApi>?

    init(dataSource : GenericDataSource<ResultApi>?) {
        self.dataSource = dataSource
    }

    func fetchTopStories() {
        
        ApiFetch.shared.fetchingDataFromApi { result in

            DispatchQueue.main.async {
                switch result {
                case .success(let topStories) :                    
                    self.dataSource?.data.value = topStories.results
                    break
                case .failure(let error) :
                    print("Parser error \(error)")
                    break
                }
            }
        }
    }

}
