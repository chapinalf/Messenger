//
//  LoginViewController.swift
//  Messenger
//
//  Created by Chapin Alf on 11/8/23.
//

import UIKit

class LoginViewController: UIViewController {

    let loginView = LoginView()
    let defaults = UserDefaults.standard
    
    //MARK: load the view....
    override func loadView() {
        view = loginView
    }
    
    //MARK: do on load...
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView.buttonLogin.addTarget(self, action: #selector(onButtonLoginTapped), for: .touchUpInside)
        
        //MARK: recognizing the taps on the app screen, not the keyboard...
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
    }
    
    //MARK: login button tapped...
    @objc func onButtonLoginTapped(){
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
