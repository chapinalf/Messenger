//
//  LoginViewController.swift
//  Messenger
//
//  Created by Chapin Alf on 11/8/23.
//

import UIKit

class LoginViewController: UIViewController {

    let loginView = LoginView()
    let childProgressView = ProgressSpinnerViewController()
    
    //MARK: load the view....
    override func loadView() {
        view = loginView
    }
    
    //MARK: do on load...
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: set up login button
        loginView.buttonLogin.addTarget(self, action: #selector(onButtonLoginTapped), for: .touchUpInside)
        
        //MARK: recognizing the taps on the app screen, not the keyboard...
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
    }
    
    //MARK: login button tapped...
    @objc func onButtonLoginTapped(){
        loginUser()
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
