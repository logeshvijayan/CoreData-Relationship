//
//  ContentModelViewController.swift
//  CoreRelationship
//
//  Created by logesh on 12/30/19.
//  Copyright © 2019 logesh. All rights reserved.
//

//MARK: - Modules
import Foundation
import UIKit

//MARK: - Class
class ContentModelViewController: UIViewController {
    
    //MARK: - Outlets and Action
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var mobileNumTextField: UITextField!
    
    @IBAction func saveButton(_ sender: Any) {
        CoreStore.shared.savePersonalData(name: nameTextfield.text!, mobilenumber: Int64(mobileNumTextField.text!)!)
    }
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

//MARK: - Extension
extension ContentModelViewController : UITextFieldDelegate {
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}
