//
//  Restaurant.swift
//  FoodPin
//
//  Created by Artem on 02.06.2023.
//

import Foundation

struct Restaurant {
    var name: String
    var type: String
    var location: String
    var image: String
    var isFavorite: Bool
    var isSuper: Bool
    
    init(name: String, type: String, location: String, image: String, isFavorite: Bool, isSuper:Bool)
    
    {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isFavorite = isFavorite
        self.isSuper = isSuper
    }
    
    init() {
        self.init(name: "", type: "", location: "", image: "" , isFavorite: false, isSuper: false)
    }
}
