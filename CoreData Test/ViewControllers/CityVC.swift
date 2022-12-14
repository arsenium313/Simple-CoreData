//
//  CityVC.swift
//  CoreData Test
//
//  Created by Арсений Кухарев on 13.12.2022.
//

import UIKit

class CityVC: UIViewController {
    
    private let foundationLabel: UILabel = {
        let label = UILabel()
        label.text = "Foundation"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .left
        return label
    }()
    
    private let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.locale = Locale(identifier: "ru-Ru")
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        return picker
    }()
    
    private let populationTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Population"
        tf.keyboardType = .decimalPad
        tf.borderStyle = .roundedRect
        tf.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return tf
    }()
    
    //MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - SetupUI
    private func setupUI(){
        setupView()
        setupFoundationLabel()
        setupDatePicker()
        setupPopulationTF()
    }

    private func setupView(){
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.navigationItem.title = "City"
    }
    
    private func setupFoundationLabel(){
        self.view.addSubview(foundationLabel)
        foundationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        foundationLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        foundationLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        foundationLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
    }
    private func setupDatePicker(){
        self.view.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        datePicker.topAnchor.constraint(equalTo: foundationLabel.bottomAnchor, constant: 10).isActive = true
        datePicker.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    private func setupPopulationTF(){
        self.view.addSubview(populationTF)
        populationTF.translatesAutoresizingMaskIntoConstraints = false
        
        populationTF.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20).isActive = true
        populationTF.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        populationTF.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 45))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButton))
        toolbar.items = [flexible, doneButton]
        populationTF.inputAccessoryView = toolbar
    }
    
    //MARK: - objc
     @objc private func doneButton(){
         populationTF.resignFirstResponder()
    }
}
