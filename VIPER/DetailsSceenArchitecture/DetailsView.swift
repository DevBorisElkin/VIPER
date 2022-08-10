//
//  DetailsView.swift
//  VIPER
//
//  Created by test on 10.08.2022.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {
    
    var textToSet: String = ""
    
    var textName: UILabel = {
        let textName = UILabel()
        textName.translatesAutoresizingMaskIntoConstraints = false
        textName.textColor = .black
        return textName
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(textName)
        textName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textName.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    
        textName.text = textToSet
        
        view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    func setData(text: String){
        textToSet = text
    }
}
