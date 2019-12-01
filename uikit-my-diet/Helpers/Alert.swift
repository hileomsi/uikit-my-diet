//
//  Alert.swift
//  uikit-my-diet
//
//  Created by Hiléo Andersson on 01/12/19.
//  Copyright © 2019 Hiléo Andersson. All rights reserved.
//

import UIKit

class Alert {
    let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func show(_ title: String, _ message: String, completion: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: completion)
        alert.addAction(action)
        
        self.view.present(alert, animated: true, completion: nil)
    }
}
