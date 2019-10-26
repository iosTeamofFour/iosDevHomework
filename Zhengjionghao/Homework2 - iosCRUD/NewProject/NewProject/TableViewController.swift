//
//  TableViewController.swift
//  NewProject
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var foodList = [Food]()
    func initList() {
        
        if let initFoodList: [Food] = loadFoodFile(){
            foodList = initFoodList
        }else{
            foodList.append(Food(name: "米饭"))
            foodList.append(Food(name: "蛋糕"))
            foodList.append(Food(name: "水果"))
            foodList.append(Food(name: "面食"))
        }
    }
    
    var perPath: String{
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("Food").path
    }
    
    func saveFoodFile(){
        if NSKeyedArchiver.archiveRootObject(foodList, toFile: perPath){
            print("success")
        }else{
            print("Fail")
        }
    }
    
    func loadFoodFile()->[Food]?{
        return (NSKeyedUnarchiver.unarchiveObject(withFile: perPath) as? [Food])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initList()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foodList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = foodList[indexPath.row].foodName
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            foodList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let editView = segue.destination as! EditViewController
        if let selectedCell = sender as? UITableViewCell{
            let indexPath = tableView.indexPath(for: selectedCell)!
            let selectedFood = foodList[(indexPath as NSIndexPath).row]
            
            editView.food = selectedFood
        }
    }
    
    
    @IBAction func exitToSave(segue: UIStoryboardSegue){
        if let editView = segue.source as? EditViewController {
             if let selectedFood = editView.food {
                if let selectedIndexPath = tableView.indexPathForSelectedRow{
                    print(selectedIndexPath)
                    
                    foodList[(selectedIndexPath as NSIndexPath).row] = selectedFood
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                    
                    saveFoodFile()
                }else{
                    
                    foodList.append(selectedFood)
                    let newIndexPath = IndexPath(row: foodList.count-1, section: 0)
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                    
                    saveFoodFile()
                }
             }
  
        }else{
            print("hello")
        }
        
    }

}
