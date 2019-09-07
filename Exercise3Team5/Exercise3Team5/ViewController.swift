//
//  ViewController.swift
//  Exercise3Team5
//
//  Created by Trinh, Spencer on 9/5/19.
//  Copyright © 2019 Trinh, Spencer. All rights reserved.
//

import UIKit

class ViewController: UIViewController, passItemProtocol {

    var groceryList = ["Egg", "Banana"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func addItemButton(_ sender: Any) {
        performSegue(withIdentifier: "addItemSeque", sender: nil)
    }
    
    @IBAction func viewListButton(_ sender: Any) {
        performSegue(withIdentifier: "showListSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Grocery App"
        navigationItem.backBarButtonItem = backItem
        if segue.identifier == "addItemSeque"{
            let addItemView = segue.destination as! addItemViewController
            addItemView.delegate = self
        }else if segue.identifier == "showListSegue"{
            let showListView = segue.destination as! ShowListViewController
            showListView.groceryList = groceryList
        }
        
    }
    
    func passItem(str: String) {
        groceryList.append(str)
        print(groceryList)
    }
}

