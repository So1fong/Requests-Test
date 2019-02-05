//
//  AddEntryVC.swift
//  RequestsTest
//
//  Created by Ekaterina Kozlova on 29.01.2019.
//  Copyright © 2019 Ekaterina Kozlova. All rights reserved.
//

import UIKit

class AddEntryVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton)
    {
        textField.text = ""
    }
    
    @IBAction func saveButton(_ sender: UIButton)
    {
        if let text = textField.text
        {
            request.addEntry(bodyStr: text)
        }
        navigationController?.popViewController(animated: true)
    }
}
