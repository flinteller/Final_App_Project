//
//  Model.swift
//  Resturant App
//
//  Created by Flint on 4/11/19.
//  Copyright © 2019 Flint. All rights reserved.
//

import Foundation

struct Restaurant: Codable {
    var name: String
    var type: String
    
    static func loadSampleRestaurants() -> [Restaurant]{
        let restaurants = [Restaurant(name: "McDonalds", type: "Fast Food")]
        return restaurants
    }
    
    
    static func saveToFile(restaurants: [Restaurant]) {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("RestaurantList").appendingPathExtension("plist")
        let propertyListEncoder = PropertyListEncoder()
        let encodedNote = try? propertyListEncoder.encode(restaurants)
        try? encodedNote?.write(to: archiveURL, options: .noFileProtection)
        
        
    }
    static func loadFromFile() -> [Restaurant]? {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let archiveURL = documentsDirectory.appendingPathComponent("RestaurantList").appendingPathExtension("plist")
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedNoteData = try? Data(contentsOf: archiveURL),
            let decodedNote = try? propertyListDecoder.decode(Array<Restaurant>.self, from: retrievedNoteData) {
            print(decodedNote)
            return decodedNote
        } else {
            return nil
        }
        
        
    }


}
