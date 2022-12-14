//
//  CountryTableVC.swift
//  CoreData Test
//
//  Created by Арсений Кухарев on 05.12.2022.
//

import UIKit

class CountryTableVC: UITableViewController {

    var countries: [String] = []
    
    private let addButton: UIBarButtonItem = {
        let item = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: #selector(showAlert))
        return item
    }()
    
    //MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    //MARK: - SetupUI
    private func setupUI(){
        setupTableView()
        setupAddButton()
    }
    
    private func setupTableView(){
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.tableView.register(CountryTableCell.self, forCellReuseIdentifier: "Cell")
        self.navigationItem.title = "Countries"
    }
    
    private func setupAddButton(){
        self.navigationItem.rightBarButtonItem = self.addButton
        self.addButton.target = self
    }
    
    //MARK: - @objc
    @objc private func showAlert(){
        let alertController = UIAlertController(title: "Add Country", message: nil, preferredStyle: .alert)
        
        let add = UIAlertAction(title: "Add", style: .default) { _ in
            guard let text = alertController.textFields?[0].text else {return}
            if text.isEmpty{return}
            self.countries.append(text)
            self.tableView.reloadData()
        }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive)
        
        alertController.addAction(add)
        alertController.addAction(cancel)
        alertController.addTextField()
        alertController.textFields![0].placeholder = "..."
        alertController.textFields![0].keyboardType = .default
        alertController.textFields![0].returnKeyType = .done
        alertController.textFields![0].autocapitalizationType = .words
        self.present(alertController, animated: true)
    }
    // MARK: - TableView DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CountryTableCell
        cell.nameLabel.text = countries[indexPath.row]
        return cell
    }

    //MARK: - TableView Delegate
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let vcToPush = CityTableVC()
        self.navigationController?.pushViewController(vcToPush, animated: true)
        return nil
    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { [self] action, view, succses in
            self.countries.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        swipe.performsFirstActionWithFullSwipe = true
        return swipe
    }
}
