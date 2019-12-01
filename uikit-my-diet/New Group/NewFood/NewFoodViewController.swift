//
//  NewFoodViewController.swift
//  uikit-my-diet
//
//  Created by Hiléo Andersson on 30/11/19.
//  Copyright © 2019 Hiléo Andersson. All rights reserved.
//

import Foundation
import UIKit

class NewFoodViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    var vm: NewFoodViewModel?
    var delegate: NewFoodDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        setupNavigation()
        
//        self.view.backgroundColor = .white
    }
    
    func setupViewModel() {
        self.vm = NewFoodViewModel(changeValid: self.changeValid(isValid:), view: self, delegate: self.delegate)
        self.nameTextField.addTarget(self.vm, action: #selector(self.vm?.changeName), for: .editingChanged)
        self.registerButton.isEnabled = self.vm?.isValid ?? false
        self.registerButton.addTarget(self, action: #selector(self.pressRegister), for: .touchDown)
    }
    
    func setupNavigation() {
        self.title = "Nova comida"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func changeValid(isValid: Bool) {
        self.registerButton.isEnabled = isValid
    }
    
    @objc func pressRegister() {
        self.vm?.pressRegister()
    }
}


// MARK: - Preview
import SwiftUI
struct NewFoodViewPreview: PreviewProvider {
    static var previews: some View {
        ContentView()
            .edgesIgnoringSafeArea(.all)
    }

    struct ContentView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<NewFoodViewPreview.ContentView>) -> UIViewController {
            return UINavigationController(rootViewController: NewFoodViewController(nibName: "NewFoodView", bundle: nil))
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NewFoodViewPreview.ContentView>) {
        }
    }
}

