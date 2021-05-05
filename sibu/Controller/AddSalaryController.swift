//
//  AddSalaryController.swift
//  sibu
//
//  Created by Achmad Fathullah on 05/05/21.
//

import UIKit

class AddSalaryController : UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
    }
    
    @objc func addTapped(){
        print("kamu")
    }
    
    @objc func closeTapped(){
        self.dismiss(animated: true, completion: nil)
    }
}
