//
//  NewMealViewModel.swift
//  uikit-my-diet
//
//  Created by Hiléo Andersson on 30/11/19.
//  Copyright © 2019 Hiléo Andersson. All rights reserved.
//

import UIKit

class NewMealViewModel: NewFoodDelegate {
    var name: String = "" {
        didSet {
            self.runValidate()
        }
    }
    var isGood: Bool = true
    var foods: [Food] = []
    var validate: ((_ isValid: Bool) -> Void)?
    
    let view: UIViewController
    let foodsTableView: UITableView
    let delegate: NewMealDelegate?
    
    init(foodsTableView: UITableView, view: UIViewController, delegate: NewMealDelegate?) {
        self.foodsTableView = foodsTableView
        self.view = view
        self.delegate = delegate
    }
    
    func createFood(food: Food) {
        self.foods.append(food)
        self.foodsTableView.reloadData()
        self.runValidate()
    }
    
    func runValidate() {
        let isValid = !self.name.isEmpty && self.foods.count > 0
        self.validate?(isValid)
    }
    
    @objc func changeName(_ textField: UITextField) {
        if let name = textField.text {
            self.name = name
        }
    }
    
    @objc func changeIsGood(_ switchField: UISwitch) {
        self.isGood = switchField.isOn
    }
    
    @objc func registerMeal() {
        let meal = Meal(name: self.name, isGood: self.isGood, foods: self.foods)
        self.delegate?.createMeal(meal: meal)
        self.view.navigationController?.popViewController(animated: true)
    }
}
