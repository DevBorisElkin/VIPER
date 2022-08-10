//
//  View.swift
//  VIPER
//
//  Created by test on 10.08.2022.
//

import Foundation
import UIKit

// can be View Controller
// protocol
// reference in presenter

protocol AnyView {
    var presenter: AnyPresenter? { get set }
    
    func update(with users: [User])
    func update(with error: String)
}

class UserViewController: UIViewController, AnyView {
    var presenter: AnyPresenter?
    var users: [User] = []
    
    private let table: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        setUpUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // maybe u should do constraints here?
        //table.frame = view.bounds
        table.backgroundColor = .blue
        //print("test")
    }
    
    func setUpUI(){
        view.addSubview(table)
        table.fillSuperview()
        table.delegate = self
        table.dataSource = self
    }
    
    func update(with users: [User]) {
        DispatchQueue.main.async {
            self.users = users
            self.table.isHidden = false
            self.table.reloadData()
        }
    }
    
    func update(with error: String) {
        var alert = UIAlertController(title: "Error", message: "Couldn't getchData", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel))
        present(alert, animated: true)
    }
    
    
}

extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
    
    
}
