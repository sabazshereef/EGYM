//
//  CustomImage.swift
//  EGYM
//
//  Created by sabaz shereef on 27/06/21.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class CustomImage:  UIImageView {
    
    var imageURL: URL?
    
    func loadImageWithUrl(_ url: URL) {
        
        imageURL = url
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: (url as AnyObject)) as? UIImage {
            
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            
            if error != nil {
                print(error as Any)
                
                return
            }
            
            DispatchQueue.main.async(execute: {
                
                if let unwrappedData = data, let imageToCache = UIImage(data: unwrappedData) {
                    if self.imageURL == url {
                        self.image = imageToCache
                    }
                    
                    imageCache.setObject(imageToCache, forKey: url as AnyObject)
                }
            })
        }).resume()
    }
}
