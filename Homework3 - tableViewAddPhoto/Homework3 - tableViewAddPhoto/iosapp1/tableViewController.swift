//
//  TableViewController.swift
//  iosapp1
//
//  Created by Apple on 2019/10/15.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var contactList:[Contact]=[Contact]()
    
    var ContactPersistPath : String{
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("ContactList").path
    }
    func initContactList()
    {
        if let contacts = NSKeyedUnarchiver.unarchiveObject(withFile: ContactPersistPath) as? [Contact] {
            contactList = contacts
        }
        else {
            contactList.append(Contact(name:"zeming",phoneNumber:"15521332013",avatar: nil))
            contactList.append(Contact(name:"jionghao",phoneNumber: "12345678901",avatar: nil))
            contactList.append(Contact(name:"shengyi",phoneNumber: "12345678911",avatar: nil))
            contactList.append(Contact(name:"zeyu",phoneNumber:"110",avatar: nil))
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initContactList()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func saveFoodFile(){
        let success = NSKeyedArchiver.archiveRootObject(contactList, toFile: ContactPersistPath)
        if !success{
            print("Failed...")
        }
    }
    
    func loadContactFile()->[Contact]?{
        return(NSKeyedUnarchiver.unarchiveObject(withFile: ContactPersistPath)as?[Contact])
    }
    
    @IBAction func cancleToList(segue:UIStoryboardSegue)
    {
        
    }
    @IBAction func saveToList(segue:UIStoryboardSegue)
    {
        if let addContactVC=segue.source as? editViewController{
            if let addContact=addContactVC.contactForEdit{
                if let selectedIndexPath=tableView.indexPathForSelectedRow{
                    contactList[(selectedIndexPath as NSIndexPath).row]=addContact
                    tableView.reloadRows(at: [selectedIndexPath], with: .none)
                }
                else{
                    contactList.append(addContact)
                    let newIndexPath=IndexPath(row:contactList.count-1,section: 0)
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                }
            }
        }
        saveFoodFile()
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return contactList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)as!ContactTableViewCell
        
        cell.name?.text=contactList[indexPath.row].name
        
        cell.phoneNumber?.text = contactList[indexPath.row].phoneNumber
        
        cell.avatar?.image=contactList[indexPath.row].avatar
        tableView.rowHeight = 80
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
            contactList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        saveFoodFile()
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
        if(segue.identifier=="showDetails")	
        {
            let editVc=segue.destination as! editViewController
            if let selectedCell=sender as? UITableViewCell{
                let indexPath=tableView.indexPath(for: selectedCell)!
                let selectedContact=contactList[(indexPath as NSIndexPath).row]
                editVc.contactForEdit=selectedContact
            }
        }
    }
}
