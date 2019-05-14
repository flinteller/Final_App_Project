//
//  ViewController.swift
//  Resturant App
//
//  Created by Flint on 4/9/19.
//  Copyright © 2019 Flint. All rights reserved.
//
// Instruction for pickerView from: https://www.ioscreator.com/tutorials/picker-view-ios-tutorial-ios10

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
   

    
    @IBOutlet weak var foodStylePicker: UIPickerView!
    
    @IBOutlet weak var ResturantTextField: UITextField!
    
    var newResturant: Restaurant?
    
    @IBAction func SaveButtonAction(_ sender: Any) {
        let resturant = ResturantTextField.text
        let style = foodStyles[foodStylePicker.selectedRow(inComponent: 0)]
        performSegue(withIdentifier: "unwindToTableView", sender: self)
        
        newResturant = Restaurant(name: resturant!, type: style)
        
        
    }
    
    
    let foodStyles = ["Italian", "Asian", "BBQ", "Mexican", "Fast Food", "Steakhouse", "Seafood", "Mediterranean", "Diner", "Pub", "Bistro","Dessert", "Other"]
    
    func numberOfComponents(in foodStylePicker: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ foodStylePicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return foodStyles.count
    }
    
    func pickerView(_ foodStylePicker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return foodStyles[row]
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        foodStylePicker.delegate = self
        
        foodStylePicker.dataSource = self
    
    }


}

