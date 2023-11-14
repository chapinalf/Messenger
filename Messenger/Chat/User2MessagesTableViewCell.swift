//
//  User2MessagesTableViewCell.swift
//  Messenger
//
//  Created by Chapin Alf on 11/14/23.
//

import UIKit

class User2MessagesTableViewCell: UITableViewCell {
    
    var wrapperCellView: UIView!
    var labelName: UILabel!
    var labelTimestamp: UILabel!
    var textViewMessage: UITextView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        setupLabelName()
        setupLabelTimestamp()
        setupTextViewMessage()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        wrapperCellView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        wrapperCellView.layer.cornerRadius = 6.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 4.0
        wrapperCellView.layer.shadowOpacity = 0.4
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupLabelName(){
        labelName = UILabel()
        labelName.font = UIFont.boldSystemFont(ofSize: 20)
        labelName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelName)
    }
    
    func setupLabelTimestamp(){
        labelTimestamp = UILabel()
        labelTimestamp.font = UIFont.systemFont(ofSize: 12)
        labelTimestamp.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelTimestamp)
    }
    
    func setupTextViewMessage(){
        textViewMessage = UITextView()
        textViewMessage.font = UIFont.systemFont(ofSize: 14)
        textViewMessage.translatesAutoresizingMaskIntoConstraints = false
        textViewMessage.isEditable = false
        textViewMessage.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        textViewMessage.isScrollEnabled = false
        wrapperCellView.addSubview(textViewMessage)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            
            labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            labelName.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 8),
            
            labelTimestamp.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            labelTimestamp.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -8),
            
            textViewMessage.topAnchor.constraint(equalTo: labelName.bottomAnchor),
            textViewMessage.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 4),
            textViewMessage.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: -8),
            textViewMessage.bottomAnchor.constraint(equalTo: wrapperCellView.bottomAnchor, constant: -8),
        ])
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}


