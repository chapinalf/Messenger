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
        cell.labelName.text = chatsList[indexPath.row].participants[0] //TODO: Update this!
        cell.labelMostRecentChat.text = chatsList[indexPath.row].messages[0] //TODO: Update this!
        return cell
    }
}
