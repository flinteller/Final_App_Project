//
//  ViewController.swift
//  Resturant App
//
//  Created by Flint on 4/9/19.
//  Copyright © 2019 Flint. All rights reserved.
//
//  Instruction for pickerView from: https://www.ioscreator.com/tutorials/picker-view-ios-tutorial-ios10
//  This file sets up my picker and text field, gets the information from them and passes it o the table view controller

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
   

    
    @IBOutlet weak var foodStylePicker: UIPickerView!
    
    @IBOutlet weak var ResturantTextField: UITextField!
    
    var newRestaurant: Restaurant?
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        
        foodStylePicker.delegate = self
        
        foodStylePicker.dataSource = self
        
    }

    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            super.prepare(for: segue, sender: sender)

            
            let restaurant = ResturantTextField.text
            let style = foodStyles[foodStylePicker.selectedRow(inComponent: 0)]
        
        
            newRestaurant = Restaurant(name: restaurant!, type: style)
        }
        
        
 
    
    
    let foodStyles = ["Italian", "Asian", "BBQ", "Mexican", "Fast Food", "Steakhouse", "Seafood", "Brunch", "Mediterranean", "Diner", "Pub", "Bistro","Dessert", "Other"]
    
    func numberOfComponents(in foodStylePicker: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ foodStylePicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return foodStyles.count
    }
    
    func pickerView(_ foodStylePicker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return foodStyles[row]
    }
    

}

