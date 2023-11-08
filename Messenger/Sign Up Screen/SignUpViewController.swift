//
//  SignUpViewController.swift
//  Messenger
//
//  Created by Chapin Alf on 11/8/23.
//

import UIKit

class SignUpViewController: UIViewController {

    let signUpView = SignUpView()
    let defaults = UserDefaults.standard
    
    //MARK: load the view...
    override func loadView() {
        view = signUpView
    }

    //MARK: do on load...
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpView.buttonSignUp.addTarget(self, action: #selector(onButtonSignUpTapped), for: .touchUpInside)
        
        //MARK: recognizing the taps on the app screen, not the keyboard...
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
    }
    
    //MARK: sign up button tapped...
    @objc func onButtonSignUpTapped(){
        self.defaults.set("1", forKey: "apiKey")
        print("API Key saved")
        dismiss(animated: true)
    }
    
    //MARK: hide Keyboard...
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }

}
