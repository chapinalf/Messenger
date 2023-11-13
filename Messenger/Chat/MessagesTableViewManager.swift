//
//  MessagesTableViewManager.swift
//  Messenger
//
//  Created by Chapin Alf on 11/13/23.
//

import Foundation
import UIKit

extension ChatViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewMessagesID, for: indexPath) as! MessagesTableViewCell
        cell.labelName.text = messagesList[indexPath.row].sender
        cell.labelMessage.text = messagesList[indexPath.row].message
        cell.labelTimestamp.text = messagesList[indexPath.row].dateTime
        return cell
    }
}
