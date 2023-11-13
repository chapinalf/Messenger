//
//  SendMessageFirebaseManager.swift
//  Messenger
//
//  Created by Chapin Alf on 11/13/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

extension ChatViewController{
    //MARK: logic to save a message to Firestore...
    func saveMessageToFireStore(message: Message, chatId: String){
        let collectionChats = database
            .collection("chats")
            .document(chatId)
            .collection("messages")
        
        //MARK: show progress indicator...
        showActivityIndicator()
        
        do{
            try collectionChats.addDocument(from: message, completion: {(error) in
                if error == nil{
                    let chatFrom = Chat(toName: self.toUserName, toEmail: self.toUserEmail, lastSentMessage: message.message)
                    self.saveMessageToFireStoreUserFrom(chatId: chatId, chat: chatFrom)
                    
                    if let userName = Auth.auth().currentUser?.displayName, let userEmail = Auth.auth().currentUser?.email{
                        let chatTo = Chat(toName: userName, toEmail: userEmail, lastSentMessage: message.message)
                        self.saveMessageToFireStoreUserTo(chatId: chatId, chat: chatTo)
                    }
                }
            })
        }catch{
            print("Error adding document!")
        }
    }
    
    //MARK: logic to save a message to a user in Firestore...
    func saveMessageToFireStoreUserFrom(chatId: String, chat: Chat){
        if let userEmail = Auth.auth().currentUser?.email{
            let collectionUsers = database
                .collection("users")
                .document(userEmail)
                .collection("chats")
            
            //MARK: show progress indicator...
            showActivityIndicator()
            
            do{
                try collectionUsers.document(chatId).setData(from: chat, completion: {(error) in
                    if error == nil{
                        
                    }
                })
            }catch{
                print("Error adding document!")
            }
        }
    }
    
    //MARK: logic to save a message to a user in Firestore...
    func saveMessageToFireStoreUserTo(chatId: String, chat: Chat){
            let collectionUsers = database
                .collection("users")
                .document(toUserEmail)
                .collection("chats")
            
            //MARK: show progress indicator...
            showActivityIndicator()
            
            do{
                try collectionUsers.document(chatId).setData(from: chat, completion: {(error) in
                    if error == nil{
                        
                        //MARK: hide progress indicator...
                        self.hideActivityIndicator()
                    }
                })
            }catch{
                print("Error adding document!")
            }
    }
}
