//
//  CountryTableVC.swift
//  CoreData Test
//
//  Created by Арсений Кухарев on 05.12.2022.
//

import UIKit

class CountryTableVC: UITableViewController {

    
    //MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    //MARK: - SetupUI
    private func setupUI(){
        setupTableView()
    }
    
    private func setupTableView(){
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        self.navigationItem.title = "Countries"
    }
    
    //MARK: - AlertController
    private func showAlert(at indexPath: Int){
        let alertController = UIAlertController(title: "Add City", message: nil, preferredStyle: .alert)
        
        let add = UIAlertAction(title: "Add", style: .default) { _ in
            guard let text = alertController.textFields?[0].text else {return}
            if text.isEmpty{return}
            let continent = countries[indexPath].continent
            let country = countries[indexPath]
            let city = City(continent: continent, country: country, city: text)
            cities.append(city)
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
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.setupUI(for: .country)
        cell.countryLabel.text = countries[indexPath.row].country
        cell.continentLabel.text = countries[indexPath.row].continent.continent
        return cell
    }

    //MARK: - TableView Delegate
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        showAlert(at: indexPath.row)
        return nil
    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { [self] action, view, succses in
            countries.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        swipe.performsFirstActionWithFullSwipe = true
        return swipe
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
