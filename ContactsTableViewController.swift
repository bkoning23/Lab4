//
//  ContactsTableViewController.swift
//  SimpleContactsApplication
//
//  Created by Brendan Koning on 10/10/15.
//  Copyright © 2015 Brendan Koning. All rights reserved.
//

import UIKit

import Foundation

class ContactsTableViewController: UITableViewController {

    
    //TODO: Edit Button
    //TODO: Row Tapped
    //TODO: Details Screen
    
    var contacts : NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.title = "Contacts"
        openAndParseJSON()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.contacts.count
    }
    
    func openAndParseJSON(){
        let filePath = NSBundle.mainBundle().pathForResource("data", ofType: "json")
        let data = NSData(contentsOfFile: filePath!)
        var parseError: NSError?
        let parsedObject: AnyObject?
        do{
            parsedObject = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
        }
        catch let error as NSError{
            parseError = error
            parsedObject = nil
        }
        if let topLevelObj = parsedObject as? NSDictionary{
            self.contacts = topLevelObj["data"] as! NSArray
            print(self.contacts.dynamicType)
        }
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath: indexPath) as! CustomTableViewCell

        let name : String = (self.contacts[indexPath.row][0] as? String)!
        let email : String = (self.contacts[indexPath.row][1] as? String)!
        let phone : String = (self.contacts[indexPath.row][2] as? String)!
        
        cell.setNameAndEmail(name, email: email)
        
        return cell
    }


    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let tempContacts = contacts.mutableCopy()
            tempContacts.removeObjectAtIndex(indexPath.row)
            self.contacts = tempContacts as! NSArray
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    	

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
