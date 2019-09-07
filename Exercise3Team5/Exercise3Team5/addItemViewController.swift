//
//  addItemViewController.swift
//  Exercise3Team5
//
//  Created by Trinh, Spencer on 9/5/19.
//  Copyright © 2019 Trinh, Spencer. All rights reserved.
//

import UIKit

protocol passItemProtocol{
    func passItem(str: String)
}

class addItemViewController: UIViewController{
   
    @IBOutlet weak var itemTextField: UITextField!
    
    var delegate: passItemProtocol?
    public var newGroceryList = [String?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = nil
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showItemBtn(_ sender: Any) {
        guard newGroceryList.count > 0 else {
            print("here")
            let alert = UIAlertController(title: "No Items added!", message: "Please add item!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { _ in
                self.dismiss(animated: true, completion:nil)
            }))
            self.present(alert, animated: true, completion: nil)
            return
        }
        performSegue(withIdentifier: "modalSegue", sender: self)
    }
    
    @IBAction func addItemBtn(_ sender: Any) {
        guard itemTextField.text!.count > 0 else {
            let alert = UIAlertController(title: "No item added!", message: "Please add item!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { _ in
                
                self.dismiss(animated: true, completion:nil)
                
            }))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        let newItem = itemTextField.text!
        delegate?.passItem(str: newItem)
        newGroceryList.append(newItem)
        let alert = UIAlertController(title: "Succesfully added item!!", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { _ in
            
            self.dismiss(animated: true, completion:nil)
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "modalSegue"{
            let showListView = segue.destination as! ShowListViewController
            showListView.groceryList = newGroceryList
        }
    }
    
    
    
}
