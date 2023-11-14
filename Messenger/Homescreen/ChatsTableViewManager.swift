//
//  ChatsTableViewManager.swift
//  Messenger
//
//  Created by Chapin Alf on 11/9/23.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewChatsID, for: indexPath) as! ChatsTableViewCell
        cell.labelName.text = chatsList[indexPath.row].toName
        cell.labelMostRecentChat.text = characterLimit(chatsList[indexPath.row].lastSentMessage)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatViewController = ChatViewController()
        chatViewController.toUserName = chatsList[indexPath.row].toName
        chatViewController.toUserEmail = chatsList[indexPath.row].toEmail
        navigationController?.pushViewController(chatViewController, animated: true)
    }
    
    func characterLimit(_ s: String) -> String {
        let maxCharLimit = 45
        
        if s.count > maxCharLimit {
            return String(s.prefix(maxCharLimit)) + "..."
        } else {
            return s
        }
    }
}
