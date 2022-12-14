//
//  CityVC.swift
//  CoreData Test
//
//  Created by Арсений Кухарев on 13.12.2022.
//

import UIKit

class CityVC: UIViewController {
    
    private let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        return picker
    }()
    
    
    
    //MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        navigationItem.title = "City!"
    }
    
    //MARK: - SetupUI
    

}
