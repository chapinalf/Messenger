//
//  ChatView.swift
//  Messenger
//
//  Created by Chapin Alf on 11/9/23.
//

import UIKit

class ChatView: UIView {

    var labelTo: UILabel!
    var textViewMessage: UITextView!
    var tableViewMessages: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: set the background color...
        self.backgroundColor = .white
        
        //MARK: initializing the UI elements and constraints...
        setupLabelTo()
        setupTableViewMessages()
        setUpTextViewMessage()
        
        initConstraints()
    }
    
    //MARK: initializing the UI elements...
    func setupLabelTo(){
        labelTo = UILabel()
        labelTo.textColor = UIColor.black
        labelTo.font = UIFont.boldSystemFont(ofSize: 22.0)
        labelTo.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelTo)
    }
    
    //MARK: initializing the UI elements...
    func setupTableViewMessages(){
        tableViewMessages = UITableView()
        tableViewMessages.register(User1MessagesTableViewCell.self, forCellReuseIdentifier: Configs.tableViewMessagesID1)
        tableViewMessages.register(User2MessagesTableViewCell.self, forCellReuseIdentifier: Configs.tableViewMessagesID2)
        tableViewMessages.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewMessages)
    }
    
    func setUpTextViewMessage(){
        textViewMessage = UITextView()
        textViewMessage.layer.borderWidth = 1
        textViewMessage.layer.borderColor = UIColor.lightGray.cgColor
        textViewMessage.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textViewMessage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: initializing constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            labelTo.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            labelTo.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
        
            tableViewMessages.topAnchor.constraint(equalTo: labelTo.bottomAnchor, constant: 8),
            tableViewMessages.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewMessages.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            tableViewMessages.heightAnchor.constraint(equalToConstant: 300),
            
            textViewMessage.topAnchor.constraint(equalTo: tableViewMessages.bottomAnchor),
            textViewMessage.leadingAnchor.constraint(equalTo:  self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            textViewMessage.trailingAnchor.constraint(equalTo:  self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            textViewMessage.bottomAnchor.constraint(equalTo:  self.keyboardLayoutGuide.topAnchor, constant: -8),
        ])
    }

    
}
