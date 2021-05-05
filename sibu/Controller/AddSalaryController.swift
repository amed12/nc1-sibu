//
//  AddSalaryController.swift
//  sibu
//
//  Created by Achmad Fathullah on 05/05/21.
//

import UIKit



class AddSalaryController : UIViewController{
    @IBOutlet weak var viewText: UIView!
    @IBOutlet weak var salaryInput: UITextField!
    var dataPassed = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        applyShadowOnView(viewText)
        salaryInput.delegate = self
    }
    
    func applyShadowOnView(_ view: UIView) {
        viewText.layer.borderWidth = 1
        viewText.layer.borderColor = UIColor.gray.cgColor
    }
    
    @objc func addTapped(){
        self.dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "backToA", sender: self)
    }
    
    @objc func closeTapped(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

extension AddSalaryController :UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            // User finished typing (hit return): hide the keyboard.
            textField.resignFirstResponder()
            return true
        }
    func textFieldDidEndEditing(_ textField: UITextField) {
        let checkDouble = Double(textField.text!)
        if checkDouble! > 0.0 {
            dataPassed = checkDouble!
        }
    }
}
