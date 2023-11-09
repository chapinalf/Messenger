//
//  HomescreenView.swift
//  Messenger
//
//  Created by Chapin Alf on 11/6/23.
//

import UIKit

class HomescreenView: UIView {

    var labelTest: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: set the background color...
        self.backgroundColor = .white
        
        //MARK: initializing the UI elements and constraints...
        setupLabelTest()
        initConstraints()
    }
    
    //MARK: initializing the UI elements...
    func setupLabelTest(){
        labelTest = UILabel()
        labelTest.text = "TEST"
        labelTest.textColor = UIColor.black
        labelTest.font = UIFont.boldSystemFont(ofSize: 22.0)
        labelTest.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelTest)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: initializing constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            labelTest.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            labelTest.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
        ])
    }

    
}
