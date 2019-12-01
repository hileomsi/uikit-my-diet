//
//  NewMealViewController.swift
//  uikit-my-diet
//
//  Created by Hiléo Andersson on 30/11/19.
//  Copyright © 2019 Hiléo Andersson. All rights reserved.
//

import UIKit

class NewMealViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var isGoodSwitch: UISwitch!
    @IBOutlet weak var foodsTableView: UITableView!
    
    var vm: NewMealViewModel?
    var delegate: NewMealDelegate?
    var addButton: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        setupNavigation()

//        self.view.backgroundColor = .white
        self.foodsTableView.dataSource = self
    }
    
    func setupViewModel() {
        self.vm = NewMealViewModel(foodsTableView: self.foodsTableView, view: self, delegate: self.delegate)
        self.nameTextField.addTarget(self.vm, action: #selector(self.vm?.changeName(_:)), for: .editingChanged)
        self.isGoodSwitch.addTarget(self.vm, action: #selector(self.vm?.changeIsGood(_:)), for: .editingChanged)
        self.vm?.validate = { isValid in
            self.addButton?.isEnabled = isValid
        }
        
    }
    
    func setupNavigation() {
        self.addButton = UIBarButtonItem(title: "Nova comida", style: .plain, target: self, action: #selector(registerMeal))
        self.addButton?.isEnabled = false
        
        self.title = "Adicionar refeição 🍜"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.rightBarButtonItem = self.addButton
    }
    
    @IBAction func navigateNewFood(_ sender: Any) {
        let newFoodView = NewFoodViewController()
        newFoodView.delegate = self.vm
        self.navigationController?.pushViewController(newFoodView, animated: true)
    }
    
    @objc func registerMeal() {
        self.vm?.registerMeal();
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = self.vm?.foods.count else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let foods = self.vm?.foods {
            let food = foods[indexPath.row]
            let cell = UITableViewCell(style: .default, reuseIdentifier: "")
            
            cell.textLabel?.text = food.name
            
            return cell
        }

        return UITableViewCell(style: .default, reuseIdentifier: "")
    }
}

// MARK: - Preview
import SwiftUI
struct NewMealViewPreview: PreviewProvider {
    static var previews: some View {
        ContentView()
            .edgesIgnoringSafeArea(.all)
    }

    struct ContentView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<NewMealViewPreview.ContentView>) -> UIViewController {
            return UINavigationController(rootViewController: NewMealViewController(nibName: "NewMealView", bundle: nil))
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NewMealViewPreview.ContentView>) {
            
        }
    }
}
