//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Macbook pro rétina on 27/07/2018.
//  Copyright © 2018 Macbook pro rétina. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var categoryArray = [Category]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
   }

  
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Gategory", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            let categ = Category(context: self.context)
            categ.name = textField.text
            self.categoryArray.append(categ)
            self.saveItems()
        }
        alert.addAction(action)
        alert.addTextField { (field) in
            textField = field
        }
        present(alert, animated: true, completion: nil)
    }
    
    //MARK - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categoryArray[indexPath.row].name
        return cell
    }
    
    
    //MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
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
            print("Error saving context \(error)")
        }
        tableView.reloadData()
    }
    
    func loadData(with request : NSFetchRequest<Category> = Category.fetchRequest()) {
        do {
            categoryArray = try context.fetch(request)
        } catch {
            print("Error loading Categories \(error)")
        }
    }
    
}
