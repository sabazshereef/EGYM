//
//  ViewController.swift
//  EGYM
//
//  Created by sabaz shereef on 19/06/21.
//

import UIKit

class ViewController: UIViewController, goToDetailPageProtocol {
   
    @IBOutlet var topListTable: UITableView!
    
    let dataSource = TopStoriesDataSource()

      lazy var viewModel : TopStoriesViewModel = {
          let viewModel = TopStoriesViewModel(dataSource: dataSource)
          return viewModel
      }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Top Stories"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always

        self.topListTable.dataSource = self.dataSource
        self.topListTable.delegate = self.dataSource
        dataSource.detailPageDelegate = self
        
        self.topListTable.register(UINib(nibName: "TopListingTableCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        self.dataSource.data.addAndNotify(observer: self) { [weak self] in
                    self?.topListTable.reloadData()
                }
        self.viewModel.fetchTopStories()
    }
    
    func passData(details: ResultApi) {
          
        let detailPage = DetailPage(nibName: "DetailPage", bundle: nil) as DetailPage
        detailPage.results = details
        self.navigationController?.pushViewController(detailPage, animated: true)
    }

}

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

protocol goToDetailPageProtocol {

    func passData(details : ResultApi)

}
