//
//  SignOutFirebaseManager.swift
//  Messenger
//
//  Created by Chapin Alf on 11/9/23.
//

import Foundation
import UIKit
import FirebaseAuth

extension ViewController{
    //MARK: sign out bar button tapped...
    @objc func onSignOutBarButtonTapped(){
        
        let logoutAlert = UIAlertController(title: "Logging out!", message: "Are you sure want to log out?",
            preferredStyle: .actionSheet)
        
        logoutAlert.addAction(UIAlertAction(title: "Yes, log out!", style: .default, handler: {(_) in
                do{
                    try Auth.auth().signOut()
                }catch{
                    self.showErrorAlert("Sign out Failed!", "You could not be signed out. Please try again!")
                }
            })
        )
        
        logoutAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        self.present(logoutAlert, animated: true)
    }
}
