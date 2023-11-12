//
//  SignupFirebaseManager.swift
//  Messenger
//
//  Created by Chapin Alf on 11/8/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

extension SignUpViewController{
    
    //MARK: check inputs and signup the user...
    func signUpUser(){
        //MARK: unwrap inputs...
        if let name = signUpView.textFieldName.text,
           let email = signUpView.textFieldEmail.text,
           let password = signUpView.textFieldPassword.text,
           let passwordConfirm = signUpView.textFieldPasswordConfirm.text{
            
            //MARK: check inputs...
            if name.isEmpty {
                self.showErrorAlert("Sign Up Failed!", "A name must be provided. Please try again!")
            } else if email.isEmpty {
                self.showErrorAlert("Sign Up Failed!", "An email must be provided. Please try again!")
            } else if password.isEmpty {
                self.showErrorAlert("Sign Up Failed!", "A password must be provided. Please try again!")
            } else if passwordConfirm.isEmpty {
                self.showErrorAlert("Sign Up Failed!", "The password must be confirmed. Please try again!")
            } else if password != passwordConfirm {
                self.showErrorAlert("Sign Up Failed!", "The password fields do not match. Please try again!")
            } else {
                //MARK: show activity indicator...
                showActivityIndicator()
                
                //MARK: create the user in firebase...
                Auth.auth().createUser(withEmail: email, password: password, completion: {result, error in
                    if error != nil{
                        self.hideActivityIndicator()
                        self.showErrorAlert("Sign Up Failed!", (String(describing: error!.localizedDescription)) + " Please try again!")
                        print("Error occured: \(String(describing: error))")
                    } else {
                        self.setNameOfTheUserInFirebaseAuth(name: name, email: email)
                    }
                })
            }
        } else {
            self.showErrorAlert("Sign Up Failed!", "The inputs provided were not valid. Please try again!")
        }
    }
    
    //MARK: set the name of the user in firebase...
    func setNameOfTheUserInFirebaseAuth(name: String, email: String){
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.commitChanges(completion: {(error) in
            if error != nil{
                self.hideActivityIndicator()
                self.showErrorAlert("Sign Up Failed!", (String(describing: error!.localizedDescription)) + " Please try again!")
            }else{
                self.saveUserToFireStore()
                self.hideActivityIndicator()
                self.dismiss(animated: true)
            }
        })
    }
    
    //MARK: logic to add a user to Firestore...
    func saveUserToFireStore(){
        if let userName = Auth.auth().currentUser?.displayName, let userEmail = Auth.auth().currentUser?.email{
            //MARK: show progress indicator...
            showActivityIndicator()
            
            database.collection("users").document(userEmail).setData([
                  "name": userName
                ]) { err in
                  if let err = err {
                      self.showErrorAlert("Sign Up Failed!", "Please try again!")
                      print("Error writing document: \(err)")
                  } else {
                      print("Document successfully written!")
                  }
                }
            
            //MARK: show progress indicator...
            showActivityIndicator()
        }
    }
    
}
