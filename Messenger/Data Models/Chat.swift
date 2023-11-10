//
//  Chat.swift
//  Messenger
//
//  Created by Chapin Alf on 11/9/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Chat: Codable{
    @DocumentID var id: String?
    var participants: [String]
    var messages: [String]
    
    init(participants: [String], messages: [String]) {
        self.participants = participants
        self.messages = messages
    }
}
