//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Nadya Postriganova on 4/2/19.
//  Copyright © 2019 Nadya Postriganova. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {

    
    var categoryArray = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

    loadItems()
    }
    
    // MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        
        cell.textLabel?.text  = categoryArray[indexPath.row].name
        
        
        return cell
    }
    
    
    //MARK - TableView Delegat Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToItems", sender: self)
    }
     
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
            let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryArray[indexPath.row]
        }
        
    }
    
    //MARK - Data Manipulation Methods
    func saveItems() {
        
        do {
            try context.save()
        } catch {
            print ("Error saving category \(error)")
        }
        tableView.reloadData()
    }
    
    func loadItems(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
        
        do {
            categoryArray = try context.fetch(request)
        }catch {
            print("Error loading categories \(error)")
        }
        
        tableView.reloadData()
    }
    
    
    //MARK - Add New Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
    // What will happen once user presss the Add Category button on UIAlert
        
        
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            
            if textField.text?.isEmpty == true {
                return
            }
        
            self.categoryArray.append(newCategory)
          
            self.saveItems()
        }
        
        alert.addTextField { (field) in
            field.placeholder = "Add a new category"
            textField = field
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    

    
    
}