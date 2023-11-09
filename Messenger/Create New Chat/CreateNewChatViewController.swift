//
//  CreateNewChatViewController.swift
//  Messenger
//
//  Created by Chapin Alf on 11/9/23.
//

import UIKit

class CreateNewChatViewController: UIViewController {

    let createNewChatView = CreateNewChatView()
    
    //MARK: load the view....
    override func loadView() {
        view = createNewChatView
    }
    
    //MARK: do on load...
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Start a Conversation"
    }
}


