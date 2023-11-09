//
//  LoginFirebaseManager.swift
//  Messenger
//
//  Created by Chapin Alf on 11/8/23.
//

import UIKit
import FirebaseAuth

extension LoginViewController{
    
    //MARK: check inputs and login in the user...
    func loginUser(){
        //MARK: unwrap inputs...
        if let email = loginView.textFieldEmail.text,
           let password = loginView.textFieldPassword.text{
        
            //MARK: check inputs...
            if email.isEmpty {
                self.showErrorAlert("Login Failed!", "An email must be provided. Please try again!")
            } else if password.isEmpty {
                self.showErrorAlert("Login Failed!", "A password must be provided. Please try again!")
            } else {
                //MARK: show activity indicator...
                showActivityIndicator()
                
                //MARK: login logic for firebase...
                self.loginToFirebase(email: email, password: password)
            }
        } else {
            self.showErrorAlert("Login Failed!", "The email and password provided were not valid. Please try again!")
        }
    }
    
    //MARK: login using firebase...
    func loginToFirebase(email: String, password: String){
        //MARK: authenticating the user...
        Auth.auth().signIn(withEmail: email, password: password, completion: { [self](result, error) in
            if error == nil{
                self.hideActivityIndicator()
                self.dismiss(animated: true)
            }else{
                self.showErrorAlert("Login Failed!", "The email and password provided were not valid. Please try again!")
                self.hideActivityIndicator()
            }
        })
    }
}



