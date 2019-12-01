//
//  Meal.swift
//  uikit-my-diet
//
//  Created by Hiléo Andersson on 29/11/19.
//  Copyright © 2019 Hiléo Andersson. All rights reserved.
//

import Foundation

class Meal {
    let name: String
    let isGood: Bool
    let foods: [Food]?
    
    init(name: String, isGood: Bool, foods: [Food]) {
        self.name = name
        self.isGood = isGood
        self.foods = foods
    }
}
