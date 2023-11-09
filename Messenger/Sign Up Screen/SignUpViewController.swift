//
//  SignUpViewController.swift
//  Messenger
//
//  Created by Chapin Alf on 11/8/23.
//

import UIKit

class SignUpViewController: UIViewController {

    let signUpView = SignUpView()
    let childProgressView = ProgressSpinnerViewController()
    
    //MARK: load the view...
    override func loadView() {
        view = signUpView
    }

    //MARK: do on load...
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: set up sign up button
        signUpView.buttonSignUp.addTarget(self, action: #selector(onButtonSignUpTapped), for: .touchUpInside)
        
        //MARK: recognizing the taps on the app screen, not the keyboard...
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
    }
    
    //MARK: sign up button tapped...
    @objc func onButtonSignUpTapped(){
        signUpUser()
    }
    
    //MARK: hide keyboard...
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
    
    //MARK: show error alert...
    func showErrorAlert(_ errorTitle: String, _ errorMessage: String){
        let alert = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }

}
