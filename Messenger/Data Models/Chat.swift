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
    var participants: [User]
    var messages: [Message]
    
    init(participants: [User], messages: [Message]) {
        self.participants = participants
        self.messages = messages
    }
}
