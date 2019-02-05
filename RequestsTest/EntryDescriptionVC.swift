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
        bodyLabel.sizeToFit()
        daLabel.text = daArray[myIndex]
        dmLabel.text = dmArray[myIndex]
        idLabel.text = idArray[myIndex]
    }
}
