//
//  ChatViewController.swift
//  Messenger
//
//  Created by Chapin Alf on 11/9/23.
//

import UIKit

class ChatViewController: UIViewController {

    let chatView = ChatView()
    
    //MARK: load the view....
    override func loadView() {
        view = chatView
    }
    
    //MARK: do on load...
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Conversation"
    }
}
