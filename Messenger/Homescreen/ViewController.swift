//
//  ViewController.swift
//  Messenger
//
//  Created by Chapin Alf on 11/6/23.
//

import UIKit

class ViewController: UIViewController {

    let homescreenView = HomescreenView()
    let defaults = UserDefaults.standard
    
    //MARK: load the view....
    override func loadView() {
        view = homescreenView
    }
    
    //MARK: do on load...
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Messenger"
        
        let apiKeySaved = defaults.object(forKey: "apiKey") as! String?
                
        if let apiKey = apiKeySaved{
            //MARK: tasks if there is a key saved
            print("The Saved API Key: \(apiKey)")
        }else{
            //MARK: tasks if there is no key saved
            print("No API Key saved at the moment!")
            
            let beforeAuth = UINavigationController(rootViewController: BeforeAuthViewController())
            
            beforeAuth.modalPresentationStyle = .fullScreen
            
            present(beforeAuth, animated: false, completion: nil)
        }
        
        //MARK: setting the add button to the navigation controller...
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self,
            action: #selector(onAddBarButtonTapped)
        )
        
        // MARK: Setting the "Sign Out" button to the navigation controller...
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Sign Out",
            style: .plain,
            target: self,
            action: #selector(onProfileButtonTapped)
        )
    }
    
    @objc func onProfileButtonTapped(){
//         let profileViewController = ProfileViewController()
//         navigationController?.pushViewController(profileViewController, animated: true)
     }
     
     @objc func onAddBarButtonTapped(){
//         let addNoteViewController = AddNoteViewController()
//         navigationController?.pushViewController(addNoteViewController, animated: true)
     }

}

