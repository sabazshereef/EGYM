//
//  TopListingTableCell.swift
//  EGYM
//
//  Created by sabaz shereef on 20/06/21.
//

import UIKit

class TopListingTableCell: UITableViewCell {
    
    @IBOutlet weak var dataImage: CustomImage!
    @IBOutlet weak var titeLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
        
    }
    func configureCell(results: ResultApi)  {
       
        titeLabel.text = results.title
        authorLabel.text = results.multimedia?[0].copyright
        if let imageUrl = URL(string: results.multimedia?[0].url ?? ""){
            dataImage.loadImageWithUrl(imageUrl)
     }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
