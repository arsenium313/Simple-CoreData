//
//  CountryTableCell.swift
//  CoreData Test
//
//  Created by Арсений Кухарев on 05.12.2022.
//

import UIKit

class CountryTableCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let continentLabel: UILabel = {
        let label = UILabel()
        label.text = "Afrika"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let citiesCountLabel: UILabel = {
        let label = UILabel()
        label.text = "78 Cities"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupUI
    private func setupUI(){
        self.contentView.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        setupNameLabel()
        setupContinentLabel()
        setupCitiesCountLabel()
    }
    
    private func setupNameLabel(){
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.45).isActive = true
    }
    
    private func setupContinentLabel(){
        self.contentView.addSubview(continentLabel)
        continentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        continentLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        continentLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 5).isActive = true
        continentLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5).isActive = true
        continentLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.40).isActive = true
    }
    
    private func setupCitiesCountLabel(){
        self.contentView.addSubview(citiesCountLabel)
        citiesCountLabel.translatesAutoresizingMaskIntoConstraints = false
       
        citiesCountLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        citiesCountLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 5).isActive = true
        citiesCountLabel.topAnchor.constraint(equalTo: continentLabel.bottomAnchor, constant: 5).isActive = true
        citiesCountLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.4).isActive = true
    }
}
