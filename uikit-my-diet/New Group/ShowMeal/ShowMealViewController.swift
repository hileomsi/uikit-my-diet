//
//  ShowMealViewController.swift
//  uikit-my-diet
//
//  Created by Hiléo Andersson on 30/11/19.
//  Copyright © 2019 Hiléo Andersson. All rights reserved.
//

import Foundation
import UIKit

class ShowMealViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var isGoodLabel: UILabel!
    @IBOutlet weak var foodsTableView: UITableView!
    
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
        setupMeal()
        
        self.foodsTableView.dataSource = self
//        self.view.backgroundColor = .white
    }
    
    func setupNavigation() {
        self.title = "Detalhes"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupMeal() {
        self.titleLabel.text = self.meal?.name
        if let isGood = self.meal?.isGood {
            self.isGoodLabel.text = isGood ? "Gostaria de repetir essa refeição" : "Não gostaria de repetir essa refeição"
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = self.meal?.foods?.count else { return 0 }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let foods = self.meal?.foods {
            let food = foods[indexPath.row]
            let cell = UITableViewCell()
            
            cell.textLabel?.text = food.name
            
            return cell
        }
        
        return UITableViewCell()
    }
}

// MARK: - Preview
import SwiftUI
struct ShowMealViewPreview: PreviewProvider {
    static var previews: some View {
        ContentView()
            .edgesIgnoringSafeArea(.all)
    }

    struct ContentView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<ShowMealViewPreview.ContentView>) -> UIViewController {
            return UINavigationController(rootViewController: ShowMealViewController(nibName: "ShowMealView", bundle: nil))
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<ShowMealViewPreview.ContentView>) {
        }
    }
}

