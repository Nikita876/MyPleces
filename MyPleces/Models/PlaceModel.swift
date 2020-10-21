//
//  PlaceModel.swift
//  MyPleces
//
//  Created by Никита Коголенок on 10/6/20.
//  Copyright © 2020 Никита Коголенок. All rights reserved.
//

import RealmSwift

class Place: Object {
    // MARK: - Variables
    @objc dynamic var name = ""
    @objc dynamic var lacation: String?
    @objc dynamic var type: String?
    @objc dynamic var imageData: Data?
    @objc dynamic var date = Date()
    @objc dynamic var rating = 0.0
    
    convenience init(name: String, lacation: String?, type: String?, imageData: Data?, rating: Double) {
        self.init()
        self.name = name
        self.lacation = lacation
        self.type = type
        self.imageData = imageData
        self.rating = rating
    }
   
}
