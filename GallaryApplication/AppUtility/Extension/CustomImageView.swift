//
//  UIImage+Extension.swift
//  GallaryApplication
//
//  Created by 2022M16 on 08/03/24.
//

import Foundation
import UIKit

class CustomImageView : UIImageView {
    
    var task : URLSessionDataTask!
    var imageCache = NSCache<AnyObject,AnyObject> ()
    
    func loadImages(url:URL) {
        
        if let task = task {
            task.cancel()
        }
        
        if let imageFromCache = self.imageCache.object(forKey: url.absoluteString as AnyObject) as? UIImage {
            self.image = imageFromCache
        }
        
        self.task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let newImage = UIImage(data: data) else {
                print("Couldn't load image from url:\(url)")
                return
            }
            
            self.imageCache.setObject(newImage, forKey: url.absoluteString as AnyObject)
            
            DispatchQueue.main.async {
                self.image = newImage
            }
        }
        task.resume()
    }
}
