//
//  SelectViewController.swift
//  Resturant App
//
//  Created by Flint on 4/25/19.
//  Copyright © 2019 Flint. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {
    
    var myRestaurants = [Restaurant]()
    var randomRestaurant: Restaurant?
    
    
    func sendAlert() {
        let alert = UIAlertController(title: "Here is your Restaurant:", message: randomRestaurant!.name, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func selectRestaurant(_ sender: Any) {
        sendAlert()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let sample = Restaurant.loadFromFile() {
            myRestaurants = sample
        } else {
            myRestaurants = Restaurant.loadSampleRestaurants()
        }
        
        randomRestaurant = myRestaurants[Int.random(in: 0 ... (myRestaurants.count))]

        // Do any additional setup after loading the view.
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
