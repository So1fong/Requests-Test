//
//  EntryDescriptionVC.swift
//  RequestsTest
//
//  Created by Ekaterina Kozlova on 30.01.2019.
//  Copyright © 2019 Ekaterina Kozlova. All rights reserved.
//

import UIKit

class EntryDescriptionVC: UIViewController
{
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var daLabel: UILabel!
    @IBOutlet weak var dmLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        bodyLabel.text = bodyArray[myIndex]
        daLabel.text = daArray[myIndex]
        dmLabel.text = dmArray[myIndex]
        idLabel.text = idArray[myIndex]
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

}
