//
//  CellGallary.swift
//  GallaryApplication
//
//  Created by 2022M16 on 08/03/24.
//

import UIKit
import SwiftyJSON

class CellGallary: UICollectionViewCell {
    
    
    //MARK: - Outlet -
    
    @IBOutlet weak var imgImage: CustomImageView!
    
    //----------------------------------------------------------------------//
    
    //MARK: - Custom Variables -
    
    
    //----------------------------------------------------------------------//
    
    //MARK: - Custom Methods -
    
    func setUp() {
        self.applyTheme()
    }
    
    
    func applyTheme() {
        
        
    }
    
    func configData(_ str:JSON) {
        self.imgImage.loadImages(url: URL(string: str["image"].stringValue)!)
    }
    //----------------------------------------------------------------------//
    
    //MARK: - Actions -
    
    
    //----------------------------------------------------------------------//
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUp()
    }
    
}
//----------------------------------------------------------------------//
