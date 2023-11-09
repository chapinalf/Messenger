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
            }else{
                //MARK: signed in...
                self.currentUser = user
                self.homescreenView.labelTest.text = "Logged in!!"
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
    }
     
    //MARK: add bar button tapped...
     @objc func onAddBarButtonTapped(){
         //TODO: implement add...
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

