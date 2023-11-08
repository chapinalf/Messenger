//
//  SignUpView.swift
//  Messenger
//
//  Created by Chapin Alf on 11/8/23.
//

import UIKit

class SignUpView: UIView {
    
    var labelSignUp: UILabel!
    var textFieldName: UITextField!
    var textFieldEmail: UITextField!
    var textFieldPassword: UITextField!
    var textFieldPasswordConfirm: UITextField!
    var buttonSignUp: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: set the background color...
        self.backgroundColor = .white
        
        //MARK: initializing the UI elements and constraints...
        setupLabelSignUp()
        setupTextFieldName()
        setupTextFieldEmail()
        setupTextFieldPassword()
        setupTextFieldPasswordConfirm()
        setupButtonSignUp()
        initConstraints()
    }
    
    //MARK: initializing the UI elements...
    func setupLabelSignUp(){
        labelSignUp = UILabel()
        labelSignUp.text = "Enter your information to sign up:"
        labelSignUp.textColor = UIColor.black
        labelSignUp.font = UIFont.boldSystemFont(ofSize: 22.0)
        labelSignUp.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelSignUp)
    }
    
    func setupTextFieldName(){
        textFieldName = UITextField()
        textFieldName.placeholder = "Name"
        textFieldName.borderStyle = .roundedRect
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldName)
    }
    
    func setupTextFieldEmail(){
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Email Address"
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldEmail)
    }
    
    func setupTextFieldPassword(){
        textFieldPassword = UITextField()
        textFieldPassword.placeholder = "Password"
        textFieldPassword.borderStyle = .roundedRect
        textFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPassword)
    }
    
    func setupTextFieldPasswordConfirm(){
        textFieldPasswordConfirm = UITextField()
        textFieldPasswordConfirm.placeholder = "Password Confirmation"
        textFieldPasswordConfirm.borderStyle = .roundedRect
        textFieldPasswordConfirm.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldPasswordConfirm)
    }
    
    func setupButtonSignUp() {
        buttonSignUp = UIButton(type: .system)
        buttonSignUp.setTitle("Sign Up", for: .normal)
        buttonSignUp.backgroundColor = UIColor(red: 246/255, green: 190/255, blue: 0, alpha: 1)
        buttonSignUp.setTitleColor(.black, for: .normal)
        buttonSignUp.layer.cornerRadius = 10
        buttonSignUp.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSignUp)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: initializing constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            labelSignUp.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            labelSignUp.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            
            textFieldName.topAnchor.constraint(equalTo: labelSignUp.bottomAnchor, constant: 20),
            textFieldName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldName.leadingAnchor.constraint(equalTo: labelSignUp.leadingAnchor),
            textFieldEmail.trailingAnchor.constraint(equalTo: labelSignUp.trailingAnchor),
            
            textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 20),
            textFieldEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldEmail.leadingAnchor.constraint(equalTo: labelSignUp.leadingAnchor),
            textFieldEmail.trailingAnchor.constraint(equalTo: labelSignUp.trailingAnchor),
            
            textFieldPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 20),
            textFieldPassword.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldPassword.leadingAnchor.constraint(equalTo: labelSignUp.leadingAnchor),
            textFieldPassword.trailingAnchor.constraint(equalTo: labelSignUp.trailingAnchor),
            
            textFieldPasswordConfirm.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor, constant: 20),
            textFieldPasswordConfirm.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldPasswordConfirm.leadingAnchor.constraint(equalTo: labelSignUp.leadingAnchor),
            textFieldPasswordConfirm.trailingAnchor.constraint(equalTo: labelSignUp.trailingAnchor),
            
            buttonSignUp.topAnchor.constraint(equalTo: textFieldPasswordConfirm.bottomAnchor, constant: 20),
            buttonSignUp.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonSignUp.leadingAnchor.constraint(equalTo: labelSignUp.leadingAnchor),
            buttonSignUp.trailingAnchor.constraint(equalTo: labelSignUp.trailingAnchor),
        ])
    }
    
}
