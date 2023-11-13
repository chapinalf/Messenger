//
//  SearchBottomSheetController.swift
//  Messenger
//
//  Created by Chapin Alf on 11/9/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class SearchBottomSheetController: UIViewController {

    let searchSheet = SearchBottomSheetView()
    
    let notificationCenter = NotificationCenter.default
    
    let database = Firestore.firestore()
    
    var users = [User]()
    
    var usersForTableView = [User]()
    
    override func loadView() {
        view = searchSheet
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: setting up Table View data source and delegate...
        searchSheet.tableViewSearchResults.delegate = self
        searchSheet.tableViewSearchResults.dataSource = self
        
        //MARK: setting up Search Bar delegate...
        searchSheet.searchBar.delegate = self
        
        //MARK: Observe Firestore database to display the contacts list...
        self.database.collection("users")
            .addSnapshotListener(includeMetadataChanges: false, listener: {querySnapshot, error in
                if let documents = querySnapshot?.documents{
                    self.usersForTableView.removeAll()
                    for document in documents{
                        do{
                            let user = try document.data(as: User.self)
                            self.users.append(user)
                        }catch{
                            print(error)
                        }
                    }
                    self.users.sort(by: {$0.name < $1.name})
                    //MARK: remove yourself as an option
                    if let indexToRemove = self.users.firstIndex(where: {$0.id! == Auth.auth().currentUser?.email}) {
                        self.users.remove(at: indexToRemove)
                    }
                    self.usersForTableView = self.users
                    self.searchSheet.tableViewSearchResults.reloadData()
                }
            })
    
    }
}

//MARK: adopting Table View protocols...
extension SearchBottomSheetController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersForTableView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: Configs.searchTableViewID, for: indexPath) as! SearchTableCell
        
        cell.labelTitle.text = usersForTableView[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //MARK: name selected....
        notificationCenter.post(name: .nameSelected, object: usersForTableView[indexPath.row])
        
        //MARK: dismiss the bottom search sheet...
        self.dismiss(animated: true)
    }
}

//MARK: adopting the search bar protocol...
extension SearchBottomSheetController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == ""{
            self.usersForTableView = users
        } else {
            self.usersForTableView.removeAll()

            for user in users{
                if user.name.contains(searchText){
                    self.usersForTableView.append(user)
                }
            }
        }
        self.searchSheet.tableViewSearchResults.reloadData()
    }
}
