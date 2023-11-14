//
//  CreateNewChatViewController.swift
//  Messenger
//
//  Created by Chapin Alf on 11/9/23.
//

import UIKit

class CreateNewChatViewController: UIViewController {
    let createNewChatView = CreateNewChatView()
    
    let searchSheetController = SearchBottomSheetController()
    var searchSheetNavController: UINavigationController!
    
    let notificationCenter = NotificationCenter.default
    
    override func loadView() {
        view = createNewChatView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New Chat"
        
        observeNameSelected()
        
        createNewChatView.buttonSelect.addTarget(self, action: #selector(onFindButtonTapped), for: .touchUpInside)
    }
    
    func setupSearchBottomSheet(){
        //MARK: setting up bottom search sheet...
        searchSheetNavController = UINavigationController(rootViewController: searchSheetController)
        searchSheetNavController.modalPresentationStyle = .pageSheet
        
        if let bottomSearchSheet = searchSheetNavController.sheetPresentationController{
            bottomSearchSheet.detents = [.medium(), .large()]
            bottomSearchSheet.prefersGrabberVisible = true
        }
    }

    //MARK: Observe if the user selected a name from bottom sheet...
    func observeNameSelected(){
        notificationCenter.addObserver(
            self,
            selector: #selector(onNameSelected(notification:)),
            name: .nameSelected, object: nil)
    }
    
    @objc func onNameSelected(notification: Notification){
        if let selectedUser = notification.object as? User {
            createNewChatView.labelName.text = selectedUser.name
            
            let chatViewController = ChatViewController()
            chatViewController.toUserName = selectedUser.name
            chatViewController.toUserEmail = selectedUser.id!
            navigationController?.pushViewController(chatViewController, animated: true)
        }
    }
    
    
    @objc func onFindButtonTapped(){
        setupSearchBottomSheet()
        present(searchSheetNavController, animated: true)
    }
}


