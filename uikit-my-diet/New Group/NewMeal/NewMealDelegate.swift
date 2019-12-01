//
//  NewMealDelegate.swift
//  uikit-my-diet
//
//  Created by Hiléo Andersson on 01/12/19.
//  Copyright © 2019 Hiléo Andersson. All rights reserved.
//

import Foundation

protocol NewMealDelegate {
    func createMeal(meal: Meal) -> Void
}
