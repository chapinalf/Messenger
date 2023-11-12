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
    
    //MARK: the array to display the table view...
    var namesForTableView = [User]()
    
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
                    self.namesForTableView.removeAll()
                    for document in documents{
                        do{
                            let user = try document.data(as: User.self)
                            self.namesForTableView.append(user)
                        }catch{
                            print(error)
                        }
                    }
                    self.namesForTableView.sort(by: {$0.name < $1.name})
                    self.searchSheet.tableViewSearchResults.reloadData()
                }
            })
        
        //MARK: remove yourself as an option
        //TODO: ASK HOW TO REMOVE YOURSELF AS AN OPTION, THIS IS NOT WORKING!
        if let indexToRemove = namesForTableView.firstIndex(where: {$0.id == Auth.auth().currentUser?.email}) {
            namesForTableView.remove(at: indexToRemove)
        }
    }
}

//MARK: adopting Table View protocols...
extension SearchBottomSheetController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesForTableView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: Configs.searchTableViewID, for: indexPath) as! SearchTableCell
        
        cell.labelTitle.text = namesForTableView[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //MARK: name selected....
        notificationCenter.post(name: .nameSelected, object: namesForTableView[indexPath.row])
        
        //MARK: dismiss the bottom search sheet...
        self.dismiss(animated: true)
    }
}

//MARK: adopting the search bar protocol...
extension SearchBottomSheetController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != ""{
            self.namesForTableView.removeAll()

            for user in namesForTableView{
                if user.name.contains(searchText){
                    self.namesForTableView.append(user)
                }
            }
        }
        self.searchSheet.tableViewSearchResults.reloadData()
    }
}
