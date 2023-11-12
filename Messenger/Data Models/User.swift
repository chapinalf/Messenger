//
//  User.swift
//  Messenger
//
//  Created by Chapin Alf on 11/12/23.
//
import Foundation
import FirebaseFirestoreSwift

struct User: Codable{
    @DocumentID var id: String?
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
