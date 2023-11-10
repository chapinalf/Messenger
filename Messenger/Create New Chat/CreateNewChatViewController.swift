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
        /* MARK: setting up modal style...
         For different kinds of modal presentation styles:
         https://medium.com/@ryu1sazae/modal-presentation-in-ios-e1fa6d89df24
         */
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
        if let selectedName = notification.object{
            createNewChatView.labelName.text = selectedName as? String
        }
    }
    
    
    @objc func onFindButtonTapped(){
        setupSearchBottomSheet()
        present(searchSheetNavController, animated: true)
    }
}


