//
//  Event.swift
//  EventMaker
//
//  Created by Anderson Lentz on 02/09/19.
//  Copyright © 2019 Raul Rodrigues. All rights reserved.
//

import Foundation

class Event: Codable, Equatable {
    static func == (lhs: Event, rhs: Event) -> Bool {
        if  lhs.address == rhs.address &&
            lhs.creator == rhs.creator &&
            lhs.date == rhs.date &&
            lhs.description == rhs.description &&
            lhs.isSharedPrice == rhs.isSharedPrice &&
            lhs.name == rhs.name &&
            lhs.participants == rhs.participants &&
            lhs.price == rhs.price {
            return true
        } else {
            return false
        }
    }
    

    enum EventKeys {
        static let address = "address"
        static let creator = "creator"
        static let date = "date"
        static let description = "description"
        static let isSharedPrice = "isSharedPrice"
        static let name = "name"
        static let participants = "participants"
        static let price = "price"
    }

    var address: String?
    var creator: String?
    var date: Double?
    var description: String?
    var isSharedPrice: Bool?
    var name: String?
    var participants: [String]?
    var price: Double?
    
    init (address:String,creator:String,date:Double,description:String,
          isSharedPrice: Bool,name: String,participants: [String],price: Double){
        self.address = address
        self.creator = creator
        self.date = date
        self.description = description
        self.isSharedPrice = isSharedPrice
        self.name = name
        self.participants = participants
        self.price = price
    }
    
    init?(eventInfo: [String: Any]) {
        
        guard let address       = eventInfo[EventKeys.address] as? String,
              let creator       = eventInfo[EventKeys.creator] as? String,
              let date          = eventInfo[EventKeys.date] as? Double,
              let description   = eventInfo[EventKeys.description] as? String,
              let isSharedPrice = eventInfo[EventKeys.isSharedPrice] as? Bool,
              let name          = eventInfo[EventKeys.name] as? String,
              let participants  = eventInfo[EventKeys.participants] as? [String],
              let price         = eventInfo[EventKeys.price] as? Double else { return nil }
        
        self.address = address
        self.creator = creator
        self.date = date
        self.description = description
        self.isSharedPrice = isSharedPrice
        self.name = name
        self.participants = participants
        self.price = price
    }

}

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}
