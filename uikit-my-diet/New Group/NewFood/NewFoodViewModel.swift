//
//  NewFoodViewModel.swift
//  uikit-my-diet
//
//  Created by Hiléo Andersson on 30/11/19.
//  Copyright © 2019 Hiléo Andersson. All rights reserved.
//

import UIKit

class NewFoodViewModel {
    var name: String = "" {
        didSet {
            self.runValidate()
        }
    }
    var isValid: Bool = false {
        didSet {
            self.changeValid(self.isValid)
        }
    }
    var changeValid: ((Bool) -> Void)
    let view: UIViewController
    let delegate: NewFoodDelegate?
    
    
    init(changeValid: @escaping ((Bool) -> Void), view: UIViewController, delegate: NewFoodDelegate?) {
        self.changeValid = changeValid
        self.view = view
        self.delegate = delegate
    }
    
    private func runValidate () {
        self.isValid = !self.name.isEmpty
    }
    
    @objc func changeName(_ textField: UITextField) {
        if let name = textField.text {
            self.name = name
        }
    }
    
    func pressRegister() {
        let alert = Alert(view: self.view)
        alert.show("Parabéns", "Comida criada com sucesso", completion: { _ in
            self.view.navigationController?.popViewController(animated: true)
            self.delegate?.createFood(food: Food(name: self.name))
        })
    }
}
