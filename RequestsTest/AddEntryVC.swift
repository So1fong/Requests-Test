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

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func cancelButtonTapped(_ sender: UIButton)
    {
        textField.text = ""
    }
    
    @IBAction func saveButton(_ sender: UIButton)
    {
        
    }
}
