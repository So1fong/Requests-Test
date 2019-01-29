//
//  ViewController.swift
//  RequestsTest
//
//  Created by Ekaterina Kozlova on 28.01.2019.
//  Copyright © 2019 Ekaterina Kozlova. All rights reserved.
//

import UIKit

var sessionId: String = ""
let request: Request = Request()

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        request.createNewSession()
    }
    
    
    @IBAction func showUserListButtonTapped(_ sender: UIButton)
    {
        request.showUserList()
    }
}

