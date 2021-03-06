//
//  ResturantTableViewController.swift
//  Resturant App
//
//  Created by Flint on 5/8/19.
//  Copyright © 2019 Flint. All rights reserved.
//  This file gets the information from the add view controller, it also sets up the table view controller

import UIKit

class ResturantTableViewController: UITableViewController {
    
    // Below function gets the new instance of a restaurant from the add view controlle and appends it to the array
    @IBAction func unwindToTableView(segue: UIStoryboardSegue) {
        let sourceViewController = segue.source as! AddViewController
        if let newRestaurant = sourceViewController.newRestaurant {
            let newIndexPath = IndexPath(row: myRestaurants.count, section:0)
            myRestaurants.append(newRestaurant)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
        Restaurant.saveToFile(restaurants: myRestaurants)
    }
    
    
    var myRestaurants = [Restaurant]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let sample = Restaurant.loadFromFile() {
            myRestaurants = sample
        } else {
            myRestaurants = Restaurant.loadSampleRestaurants()
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // Below function makes swipe to delete possible 
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
        myRestaurants.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
     }
        Restaurant.saveToFile(restaurants: myRestaurants)
     }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myRestaurants.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantCell", for: indexPath)
        
        let restaurant = myRestaurants[indexPath.row]
        cell.textLabel?.text = restaurant.name
        cell.detailTextLabel?.text = restaurant.type
        
        return cell
    }
    
    
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
