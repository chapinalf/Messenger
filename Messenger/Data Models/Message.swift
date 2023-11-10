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
    var sender: User
    var message: String
    var dateTime: Date
    
    init(sender: User, message: String, dateTime: Date) {
        self.sender = sender
        self.message = message
        self.dateTime = dateTime
    }
}
