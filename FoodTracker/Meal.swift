//
//  File.swift
//  FoodTracker
//
//  Created by kostya on 6/25/18.
//  Copyright © 2018 kostya. All rights reserved.
//

import UIKit
import os.log

class Meal : NSObject, NSCoding {
    
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    var feelings: String?
    
    init?(name: String, photo: UIImage?, rating: Int, feelings: String?) {
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0 || rating > 5 {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        self.feelings = feelings
    }
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    //MARK: Types
    
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
        static let feelings = "feelings"
    }
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
        aCoder.encode(feelings, forKey: PropertyKey.feelings)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        
        let feelings = aDecoder.decodeObject(forKey: PropertyKey.feelings) as? String
        
        self.init(name: name, photo: photo, rating: rating, feelings: feelings)
    }
    
    
    
}
