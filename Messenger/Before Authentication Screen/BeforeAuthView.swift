//
//  BeforeAuthView.swift
//  Messenger
//
//  Created by Chapin Alf on 11/8/23.
//

import UIKit

class BeforeAuthView: UIView {
    
    var container: UIView!
    var labelNotes: UILabel!
    var buttonLogin: UIButton!
    var buttonSignUp: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: set the background color...
        self.backgroundColor = .white
        
        //MARK: initializing the UI elements and constraints...
        setupContainer()
        setupLabelNotes()
        setupButtonLogin()
        setupButtonSignUp()
        initConstraints()
    }

    //MARK: initializing the UI elements...
    func setupContainer(){
        container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(container)
    }
    
    func setupLabelNotes(){
        labelNotes = UILabel()
        labelNotes.text = "Messenger"
        labelNotes.textColor = UIColor.black
        labelNotes.font = UIFont.boldSystemFont(ofSize: 36.0)
        labelNotes.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelNotes)
    }
    
    func setupButtonLogin() {
        buttonLogin = UIButton(type: .system)
        buttonLogin.setTitle("Login", for: .normal)
        buttonLogin.backgroundColor = UIColor(red: 246/255, green: 190/255, blue: 0, alpha: 1)
        buttonLogin.setTitleColor(.black, for: .normal)
        buttonLogin.layer.cornerRadius = 10
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonLogin)
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
            container.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            labelNotes.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            labelNotes.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: -40),
            
            buttonLogin.topAnchor.constraint(equalTo: labelNotes.bottomAnchor, constant: 20),
            buttonLogin.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            buttonLogin.widthAnchor.constraint(equalTo: labelNotes.widthAnchor),
            
            buttonSignUp.topAnchor.constraint(equalTo: buttonLogin.bottomAnchor, constant: 20),
            buttonSignUp.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            buttonSignUp.widthAnchor.constraint(equalTo: labelNotes.widthAnchor),
        ])
    }
    
}


