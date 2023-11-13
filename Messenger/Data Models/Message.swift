//
//  Message.swift
//  Messenger
//
//  Created by Chapin Alf on 11/10/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Message: Codable{
    @DocumentID var id: String?
    var sender: String
    var message: String
    var dateTime: String
    
    init(sender: String, message: String, dateTime: String) {
        self.sender = sender
        self.message = message
        self.dateTime = dateTime
    }
}
