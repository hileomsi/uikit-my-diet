//
//  MealsViewModel.swift
//  uikit-my-diet
//
//  Created by Hiléo Andersson on 29/11/19.
//  Copyright © 2019 Hiléo Andersson. All rights reserved.
//

import UIKit

class MealsViewModel: NewMealDelegate {
    var meals: [Meal] = []

    let tableView: UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    func createMeal(meal: Meal) {
        self.meals.append(meal)
        self.tableView.reloadData()
    }
}
