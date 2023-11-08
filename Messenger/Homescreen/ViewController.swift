//
//  ViewController.swift
//  Messenger
//
//  Created by Chapin Alf on 11/6/23.
//

import UIKit

class ViewController: UIViewController {

    let homescreenView = HomescreenView()
    
    //MARK: load the view....
    override func loadView() {
        view = homescreenView
    }
    
    //MARK: do on load...
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

