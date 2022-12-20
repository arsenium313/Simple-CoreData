//
//  TableVC.swift
//  CoreData Test
//
//  Created by Арсений Кухарев on 01.12.2022.
//

import UIKit

class ContinentTableVC: UITableViewController {
    
    var continents: [Continent] = []
    var rowBeenSelected: Int?
    
    private let addButton: UIBarButtonItem = {
        let item = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: #selector(showAlertAddContinent))
        return item
    }()
    
    //MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        continents = DataManager.shared.fetchContinents()
        setupUI()
    }

    //MARK: - SetupUI
    private func setupUI(){
        setupTableView()
        setupAddButton()
    }
    
    private func setupTableView(){
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        self.navigationItem.title = "Continents"
    }
    
    private func setupAddButton(){
        self.navigationItem.rightBarButtonItem = self.addButton
        self.addButton.target = self
    }
    
    //MARK: - @objc, AlertController
    @objc private func showAlertAddContinent(){
        let alertController = UIAlertController(title: "Add Continent", message: nil, preferredStyle: .alert)
        
        let add = UIAlertAction(title: "Add", style: .default) { _ in
            guard let text = alertController.textFields?[0].text else {return}
            if text.isEmpty{return}
            let continent = DataManager.shared.continent(name: text)
            DataManager.shared.saveContext()
            self.continents.append(continent)
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
    
    private func showAlertAddCountry(at index: Int){
        let alertController = UIAlertController(title: "Add Country", message: nil, preferredStyle: .alert)
        
        let add = UIAlertAction(title: "Add", style: .default) { _ in
            guard let text = alertController.textFields?[0].text else {return}
            if text.isEmpty{return}
            
            let continent = self.continents[index]
            let country = DataManager.shared.country(name: text, continent: continent)
            DataManager.shared.saveContext()
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
    
    //MARK: - TableView DataSource
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.setupUI(for: .continent)
        cell.continentLabel.text = continents[indexPath.row].name ?? "NILL!"
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return continents.count
    }

    //MARK: - Tableview Delegate
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        rowBeenSelected = indexPath.row
        showAlertAddCountry(at: indexPath.row)
        return nil
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (action, view, succses) in
            let continent = self?.continents[indexPath.row]
            DataManager.shared.delete(continent)
            self?.continents.remove(at: indexPath.row)
            self?.tableView.reloadData()
        }
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        swipe.performsFirstActionWithFullSwipe = true
        return swipe
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
