//
//  MessagesTableViewManager.swift
//  Messenger
//
//  Created by Chapin Alf on 11/13/23.
//

import Foundation
import UIKit
import FirebaseAuth

extension ChatViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if messagesList[indexPath.row].sender == Auth.auth().currentUser?.displayName {
            let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewMessagesID1, for: indexPath) as! User1MessagesTableViewCell
            cell.selectionStyle = .none
            cell.labelName.text = messagesList[indexPath.row].sender
            cell.textViewMessage.text = messagesList[indexPath.row].message
            cell.labelTimestamp.text = messagesList[indexPath.row].dateTime
            cell.wrapperCellView.bottomAnchor.constraint(equalTo: cell.textViewMessage.bottomAnchor).isActive = true
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewMessagesID2, for: indexPath) as! User2MessagesTableViewCell
            cell.selectionStyle = .none
            cell.labelName.text = messagesList[indexPath.row].sender
            cell.textViewMessage.text = messagesList[indexPath.row].message
            cell.labelTimestamp.text = messagesList[indexPath.row].dateTime
            cell.wrapperCellView.bottomAnchor.constraint(equalTo: cell.textViewMessage.bottomAnchor).isActive = true
            return cell
        }
    }
}
