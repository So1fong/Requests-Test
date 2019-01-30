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
var testArray: [String] = ["1", "2", "3", "4"]

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (testArray.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        cell.daLabel.text = "da"
        cell.dmLabel.text = "dm"
        cell.entryLabel.text = "entry"
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    
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

