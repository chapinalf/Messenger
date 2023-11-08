//
//  BeforeAuthViewController.swift
//  Messenger
//
//  Created by Chapin Alf on 11/8/23.
//

import UIKit

class BeforeAuthViewController: UIViewController {

    let beforeAuthView = BeforeAuthView()
    
    //MARK: load the view....
    override func loadView() {
        view = beforeAuthView
    }

    //MARK: do on load...
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: true)
        beforeAuthView.buttonLogin.addTarget(self, action: #selector(onButtonLoginTapped), for: .touchUpInside)
        beforeAuthView.buttonSignUp.addTarget(self, action: #selector(onButtonSignUpTapped), for: .touchUpInside)
    }
    
    //MARK: login button tapped...
    @objc func onButtonLoginTapped(){
        let loginViewController = LoginViewController()
        navigationController?.pushViewController(loginViewController, animated: true)
    }
    
    //MARK: sign up button tapped...
    @objc func onButtonSignUpTapped(){
        let signupViewController = SignUpViewController()
        navigationController?.pushViewController(signupViewController, animated: true)
    }
    
    

}
