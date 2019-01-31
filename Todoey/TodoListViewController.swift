//
//  ViewController.swift
//  Todoey
//
//  Created by Nadya Postriganova on 31/1/19.
//  Copyright © 2019 Nadya Postriganova. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController{
    
    let ittemArray = ["Find Mike", "Buy Eggos", "Destroy demogogos"]

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    //MARK - Tableview Datasource Methods]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ittemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        cell.textLabel?.text = ittemArray[indexPath.row]
    
        return cell
    }

    //MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(ittemArray[indexPath.row])
    
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
           
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}

