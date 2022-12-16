//
//  TableViewCell.swift
//  CoreData Test
//
//  Created by Арсений Кухарев on 16.12.2022.
//

import UIKit

enum CellType {
    case continent
    case country
    case city
}

class TableViewCell: UITableViewCell {

    let continentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let countryLabel: UILabel = {
        let label = UILabel()
        label.text = "Countries counter"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.text = "Cities counters"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    //MARK: - SetupUI
    func setupUI(for cell: CellType){
        self.contentView.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
       
        self.contentView.addSubview(continentLabel)
        self.contentView.addSubview(countryLabel)
        self.contentView.addSubview(cityLabel)
        
        continentLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        switch cell {
        case .continent:
            setupUIForContinentCell()
        case .country:
            setupUIForCountryCell()
        case .city:
            setupUIForCityCell()
        }
    }

    private func setupUIForContinentCell(){
        continentLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        continentLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        continentLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.45).isActive = true
        
        countryLabel.leadingAnchor.constraint(equalTo: continentLabel.trailingAnchor, constant: 5).isActive = true
        countryLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        countryLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5).isActive = true
        countryLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.40).isActive = true
        
        cityLabel.leadingAnchor.constraint(equalTo: continentLabel.trailingAnchor, constant: 5).isActive = true
        cityLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        cityLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 5).isActive = true
        cityLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.40).isActive = true
    }
    
    private func setupUIForCountryCell(){
        countryLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        countryLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        countryLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.45).isActive = true
        
        continentLabel.leadingAnchor.constraint(equalTo: countryLabel.trailingAnchor, constant: 5).isActive = true
        continentLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        continentLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5).isActive = true
        continentLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.40).isActive = true
        
        cityLabel.leadingAnchor.constraint(equalTo: countryLabel.trailingAnchor, constant: 5).isActive = true
        cityLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        cityLabel.topAnchor.constraint(equalTo: continentLabel.bottomAnchor, constant: 5).isActive = true
        cityLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.40).isActive = true
    }
    
    private func setupUIForCityCell(){
        cityLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10).isActive = true
        cityLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        cityLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.45).isActive = true
        
        continentLabel.leadingAnchor.constraint(equalTo: cityLabel.trailingAnchor, constant: 5).isActive = true
        continentLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        continentLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5).isActive = true
        continentLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.40).isActive = true
        
        countryLabel.leadingAnchor.constraint(equalTo: cityLabel.trailingAnchor, constant: 5).isActive = true
        countryLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        countryLabel.topAnchor.constraint(equalTo: continentLabel.bottomAnchor, constant: 5).isActive = true
        countryLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.40).isActive = true
    }
}
