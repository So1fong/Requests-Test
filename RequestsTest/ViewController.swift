//
//  ViewController.swift
//  RequestsTest
//
//  Created by Ekaterina Kozlova on 28.01.2019.
//  Copyright © 2019 Ekaterina Kozlova. All rights reserved.
//

import UIKit

var sessionId: String = ""
var bodyArray = ["entry"]
var daArray = ["da"]
var dmArray = ["dm"]
let request: Request = Request()

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (bodyArray.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        cell.daLabel.text = daArray[indexPath.row]//"da"
        if daArray[indexPath.row] != dmArray[indexPath.row]
        {
            cell.dmLabel.text = dmArray[indexPath.row]//"dm"
        }
        else
        {
            cell.dmLabel.text = ""
        }
        cell.entryLabel.text = bodyArray[indexPath.row]
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        request.createNewSession()
        tableView.reloadData()
        
    }
    
    func reloadTableView()
    {
        tableView.reloadData()
    }
    
    @IBAction func showUserListButtonTapped(_ sender: UIButton)
    {
        request.showUserList()
        tableView.reloadData()
    }
}

