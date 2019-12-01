//
//  MealsViewController.swift
//  uikit-my-diet
//
//  Created by Hiléo Andersson on 29/11/19.
//  Copyright © 2019 Hiléo Andersson. All rights reserved.
//

import UIKit

class MealsViewController: UITableViewController {
    var vm: MealsViewModel?
    var addButton: UIBarButtonItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        setupNavigation()
    }
    
    // MARK: - Setups
    func setupViewModel() {
        self.vm = MealsViewModel(tableView: self.tableView)
    }

    func setupNavigation() {
        self.addButton = UIBarButtonItem(title: "Adicionar", style: .plain, target: self, action: #selector(pressAdd))

        self.title = "Refeições 🍽"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.rightBarButtonItem = self.addButton
    }
    
    // MARK: - Actions
    @objc func pressAdd() {
        let newMealView = NewMealViewController()
        newMealView.delegate = self.vm
        self.navigationController?.pushViewController(newMealView, animated: true)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = self.vm?.meals.count else { return 0 }
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let meals = self.vm?.meals {
            let meal = meals[indexPath.row]
            let cell = UITableViewCell()
            
            cell.textLabel?.text = meal.name
            cell.detailTextLabel?.text = meal.isGood ? "Ótima refeição" : "Precisa trocar"

            return cell
        }

        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let meal = self.vm?.meals[indexPath.row]
        let showMealView = ShowMealViewController()
        
        showMealView.meal = meal
        
        self.navigationController?.pushViewController(showMealView, animated: true)
    }
}


// MARK: - Preview
import SwiftUI
struct MealsViewPreview: PreviewProvider {
    static var previews: some View {
        ContentView()
            .edgesIgnoringSafeArea(.all)
    }

    struct ContentView: UIViewControllerRepresentable {
        func updateUIViewController(_ uiViewController: MealsViewPreview.ContentView.UIViewControllerType, context: UIViewControllerRepresentableContext<MealsViewPreview.ContentView>) {

        }

        func makeUIViewController(context: UIViewControllerRepresentableContext<MealsViewPreview.ContentView>) -> UIViewController {
            return UINavigationController(rootViewController: MealsViewController())
        }
    }
}
