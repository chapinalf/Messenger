//
//  CreateNewChatView.swift
//  Messenger
//
//  Created by Chapin Alf on 11/9/23.
//

import UIKit

class CreateNewChatView: UIView {

    var labelName: UILabel!
    var buttonSelect: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: set the background color...
        self.backgroundColor = .white
        
        //MARK: initializing the UI elements and constraints...
        setUpLabelName()
        setUpButtonSelect()
        initConstraints()
        
    }
    
    //MARK: initializing the UI elements 
    func setUpLabelName(){
        labelName = UILabel()
        labelName.text = "Tap Find to search a name..."
        labelName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelName)
    }
    
    func setUpButtonSelect(){
        buttonSelect = UIButton(type: .system)
        buttonSelect.setTitle("Find", for: .normal)
        buttonSelect.setImage(UIImage(systemName: "magnifyingglass.circle.fill"), for: .normal)
        buttonSelect.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSelect)
    }
    
    //MARK: initializing constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            buttonSelect.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            buttonSelect.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            labelName.topAnchor.constraint(equalTo: buttonSelect.bottomAnchor, constant: 16),
            labelName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
