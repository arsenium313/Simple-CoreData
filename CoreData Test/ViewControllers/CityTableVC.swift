//
//  CityTableVC.swift
//  CoreData Test
//
//  Created by Арсений Кухарев on 13.12.2022.
//

import UIKit

class CityTableVC: UITableViewController {

    var cities: [City] = []
    
    //MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        cities = DataManager.shared.fetchCities()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cities = DataManager.shared.fetchCities()
        self.tableView.reloadData()
    }
    
    //MARK: - SetupUI
    private func setupUI(){
        setupTableView()
    }
    
    private func setupTableView(){
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "Cell")
        self.navigationItem.title = "Cities"
    }
    
    // MARK: - TableView DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let city = cities[indexPath.row]
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.setupUI(for: .city)
        cell.cityLabel.text = city.name
        cell.continentLabel.text = city.continent?.name
        cell.countryLabel.text = city.country?.name
        return cell
    }
 
    //MARK: - TableView Delegate
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { [self] action, view, succses in
            let city = self.cities[indexPath.row]
            DataManager.shared.delete(city)
            self.cities.remove(at: indexPath.row)
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
