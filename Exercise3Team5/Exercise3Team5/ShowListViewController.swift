//
//  ShowListViewController.swift
//  Exercise3Team5
//
//  Created by Christian Tith on 9/5/19.
//  Copyright © 2019 Trinh, Spencer. All rights reserved.
//

import UIKit

class ShowListViewController : UIViewController {
    
    var groceryList = [String?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = nil

    }
    
    override func viewDidAppear(_ animated: Bool) {
        let alert = UIAlertController(title: "Grocery List", message: "", preferredStyle: .actionSheet)
        for item in groceryList{
            alert.addAction(UIAlertAction(title: item, style: .default, handler:{ _ in
                self.dismiss(animated: true, completion: nil)
            }))
        }
        
        self.present(alert, animated: true, completion: nil)
    }
}
