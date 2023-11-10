//
//  User.swift
//  Messenger
//
//  Created by Chapin Alf on 11/10/23.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable{
    @DocumentID var id: String?
    var name: String
    var chats: [Chat]
    
    init(name: String, chats: [Chat]) {
        self.name = name
        self.chats = chats
    }
}
