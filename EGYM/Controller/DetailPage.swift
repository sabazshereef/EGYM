//
//  DetailPage.swift
//  EGYM
//
//  Created by sabaz shereef on 24/06/21.
//

import UIKit
import SafariServices

class DetailPage: UIViewController,SFSafariViewControllerDelegate, detailPageProtocol{
   
    func passData(details: ResultApi) {
        results = details
    }
   
    @IBOutlet weak var AuthorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titileLabel: UILabel!
    @IBOutlet weak var newsImage: CustomImage!
    
    var results : ResultApi?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.title = "News Details"
        view.backgroundColor = .white
       
        AuthorLabel.text = results?.multimedia?[0].copyright
        titileLabel.text = results?.title
        descriptionLabel.text = results?.abstract
       
        if let imageUrl = URL(string:results?.multimedia?[0].url ?? ""){
            newsImage.loadImageWithUrl(imageUrl)
        }
       
    }
    
    @IBAction func seeMoreTap(_ sender: Any) {
   
        if let url = URL(string: results?.url ?? "") {
        let urlForNews = SFSafariViewController(url: url)
            urlForNews.delegate = self
            present(urlForNews, animated: true, completion: nil)
        }
    }
    
}
