//
//  PlaceModel.swift
//  MyPleces
//
//  Created by Никита Коголенок on 10/6/20.
//  Copyright © 2020 Никита Коголенок. All rights reserved.
//

import RealmSwift

class Place: Object {
    
    dynamic var name = ""
    dynamic var lacation: String?
    dynamic var type: String?
    dynamic var imageData: Data?
    
    convenience init(name: String, lacation: String?, type: String?, imageData: Data?) {
        self.init()
        self.name = name
        self.lacation = lacation
        self.type = type
        self.imageData = imageData
    }
   
}
