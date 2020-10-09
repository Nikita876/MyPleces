//
//  StorageManager.swift
//  MyPleces
//
//  Created by Никита Коголенок on 10/9/20.
//  Copyright © 2020 Никита Коголенок. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    static func saveObject(_ place: Place) {
        
        try! realm.write {
            realm.add(place)
        }
    }
    
    static func deleteObject(_ place: Place) {
        try! realm.write {
            realm.delete(place)
        }
        
    }
}
