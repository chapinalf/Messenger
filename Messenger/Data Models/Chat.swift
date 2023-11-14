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
    var toName: String
    var toEmail: String
    var lastSentMessage: String
    
    init(toName: String, toEmail: String, lastSentMessage: String) {
        self.toName = toName
        self.toEmail = toEmail
        self.lastSentMessage = lastSentMessage
    }
}
