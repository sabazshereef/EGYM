//
//  TopStoriesDataSource.swift
//  EGYM
//
//  Created by sabaz shereef on 27/06/21.
//

import Foundation
import UIKit
class TopStoriesDataSource : GenericDataSource<ResultApi>, UITableViewDataSource,UITableViewDelegate {

    var detailPageDelegate : detailPageProtocol?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TopListingTableCell

        cell.configureCell(results: self.data.value[indexPath.row])
      
        return cell
    }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    detailPageDelegate?.passData(details: self.data.value[indexPath.row])
   
}
}
