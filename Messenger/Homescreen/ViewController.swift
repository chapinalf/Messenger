//
//  ViewController.swift
//  Messenger
//
//  Created by Chapin Alf on 11/6/23.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    let homescreenView = HomescreenView()
    var handleAuth: AuthStateDidChangeListenerHandle?
    var currentUser:FirebaseAuth.User?
    var chatsList = [Chat]()
    
    //MARK: load the view....
    override func loadView() {
        view = homescreenView
    }
    
    //MARK: view appears...
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //MARK: handling if the authentication state is changed (sign in, sign out, register)...
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            if user == nil{
                //MARK: not signed in...
                self.currentUser = nil
                let beforeAuth = UINavigationController(rootViewController: BeforeAuthViewController())
                beforeAuth.modalPresentationStyle = .fullScreen
                self.present(beforeAuth, animated: false, completion: nil)
                
                //MARK: reset table view...
                self.chatsList.removeAll()
                self.homescreenView.tableViewChats.reloadData()
            }else{
                //MARK: signed in...
                self.currentUser = user
                
                //MARK: observe firestore database to display the chats list...
                //TODO: !!
            }
        }
    }
    
    //MARK: do on load...
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Messenger"
        
        // MARK: setting the "sign out" button to the navigation controller...
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(onSignOutBarButtonTapped))
        
        //MARK: setting the add button to the navigation controller...
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onAddBarButtonTapped)
        )
        
        //MARK: patching table view delegate and data source...
        homescreenView.tableViewChats.delegate = self
        homescreenView.tableViewChats.dataSource = self
        
        //MARK: removing the separator line...
        homescreenView.tableViewChats.separatorStyle = .none
    }
     
    //MARK: add bar button tapped...
     @objc func onAddBarButtonTapped(){
         let createNewChatViewController = CreateNewChatViewController()
         navigationController?.pushViewController(createNewChatViewController, animated: true)
     }
    
    //MARK: view will disappear...
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handleAuth!)
    }
    
    //MARK: show error alert...
    func showErrorAlert(_ errorTitle: String, _ errorMessage: String){
        let alert = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }

}

