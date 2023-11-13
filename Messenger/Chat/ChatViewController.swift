//
//  ChatViewController.swift
//  Messenger
//
//  Created by Chapin Alf on 11/9/23.
//

import UIKit
import FirebaseAuth
import CryptoKit
import FirebaseFirestore
import FirebaseFirestoreSwift

class ChatViewController: UIViewController {

    let chatView = ChatView()
    var toUserName: String!
    var toUserEmail: String!
    var messagesList = [Message]()
    let database = Firestore.firestore()
    let childProgressView = ProgressSpinnerViewController()
    
    //MARK: load the view....
    override func loadView() {
        view = chatView
    }
    
    //MARK: view appears...
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let chatId = generateUUID(emails: [(Auth.auth().currentUser?.email)!, toUserEmail])
        
        //MARK: observe firestore database to display the chats list...
        self.database.collection("chats")
            .document(chatId)
            .collection("messages")
            .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                if let documents = querySnapshot?.documents{
                    self.messagesList.removeAll()
                    for document in documents{
                        do{
                            let message = try document.data(as: Message.self)
                            self.messagesList.append(message)
                        }catch{
                            print(error)
                        }
                    }
                    self.chatView.tableViewMessages.reloadData()
                }
            })
    }
    
    //MARK: do on load...
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Conversation"
        chatView.labelTo.text = toUserName
        
        //MARK: setting the add button to the navigation controller...
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Send", style: .plain, target: self, action: #selector(onSendBarButtonTapped)
        )
        
        //MARK: patching table view delegate and data source...
        chatView.tableViewMessages.delegate = self
        chatView.tableViewMessages.dataSource = self
        
        //MARK: removing the separator line...
        chatView.tableViewMessages.separatorStyle = .none
    }

    func getCurrentDateAndTime() -> String {
        let currentDate = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yy HH:mm"
        
        let formattedDate = dateFormatter.string(from: currentDate)
        
        return formattedDate
    }
    
    func generateUUID(emails: [String]) -> String{
        let sortedEmails = emails.sorted()
        let joinedEmails = sortedEmails.joined()
        let joinedEmailsData = Data(joinedEmails.utf8)
        let hashed = Insecure.MD5.hash(data: joinedEmailsData)
        return hashed.compactMap{String(format: "%02x", $0)}.joined()
    }
    
    //MARK: send bar button tapped...
     @objc func onSendBarButtonTapped(){
         
         if let userName = Auth.auth().currentUser?.displayName, let userEmail = Auth.auth().currentUser?.email, let message = chatView.textViewMessage.text {
             if !message.isEmpty {
                 let message = Message(sender: userName, message: message, dateTime: getCurrentDateAndTime())
                 let chatId = generateUUID(emails: [userEmail, toUserEmail])
                 saveMessageToFireStore(message: message, chatId: chatId)
                 chatView.textViewMessage.text = ""
             }
         }
     }
}
