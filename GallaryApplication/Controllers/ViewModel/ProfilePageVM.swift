//
//  ProfilePageVM.swift
//  GallaryApplication
//
//  Created by 2022M16 on 08/03/24.
//

import UIKit
import SwiftyJSON

class ProfilePageVM {
    
    var arrImagesUrls : [JSON] = [
        
        ["image":"https://bit.ly/3pu2yID"],
        ["image":"https://bit.ly/3Esxy1H"],
        ["image":"https://bit.ly/3or9ff1"],
        ["image":"https://bit.ly/3Gii2GH"],
        ["image":"https://bit.ly/3rEAMf5"],
        ["image":"https://bit.ly/2ZVYMig"],
        ["image":"https://bit.ly/32SDcMG"],
        ["image":"https://bit.ly/3ps6bP3"],
        ["image":"https://bit.ly/3GgN2X7"],
        ["image":"https://bit.ly/32SX7es"],
        ["image":"https://bit.ly/3otiBqU"],
        ["image":"https://bit.ly/3ImWMkq"],
        ["image":"https://bit.ly/3pu2yID"],
        ["image":"https://bit.ly/3Esxy1H"],
        ["image":"https://bit.ly/3or9ff1"],
        ["image":"https://bit.ly/3Gii2GH"],
        ["image":"https://bit.ly/3rEAMf5"],
        ["image":"https://bit.ly/2ZVYMig"],
        ["image":"https://bit.ly/32SDcMG"],
        ["image":"https://bit.ly/3ps6bP3"],
        ["image":"https://bit.ly/3GgN2X7"],
        ["image":"https://bit.ly/32SX7es"],
        ["image":"https://bit.ly/3otiBqU"],
        ["image":"https://bit.ly/3ImWMkq"]
        
]
    
    
}

extension ProfilePageVM {
    
    func numberOfListRow() -> Int {
        self.arrImagesUrls.count
    }
    
    func listRow(for index: Int) -> JSON {
        self.arrImagesUrls[index]
    }
    
}
   
