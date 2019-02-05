//
//  ViewController.swift
//  RequestsTest
//
//  Created by Ekaterina Kozlova on 28.01.2019.
//  Copyright © 2019 Ekaterina Kozlova. All rights reserved.
//

import UIKit

var sessionId: String = ""
var bodyArray: [String] = []
var daArray: [String] = []
var dmArray: [String] = []
var idArray: [String] = []
var myIndex = 0
let request: Request = Request()


class ViewController: UIViewController, RequestDelegate, UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (bodyArray.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewControllerTableViewCell
        cell.daLabel.text = daArray[indexPath.row]
        if daArray[indexPath.row] != dmArray[indexPath.row]
        {
            cell.dmLabel.text = dmArray[indexPath.row]
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
        request.delegate = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    @objc func reloadTableView()
    {
        DispatchQueue.main.async
        {
            self.tableView.reloadData()
        }
    }
    
    func showAlertController()
    {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Ошибка", message: "Отсутствует соединение с сервером", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Oк", style: .default, handler: nil))
            alertController.addAction(UIAlertAction(title: "Обновить", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func showUserListButtonTapped(_ sender: UIButton)
    {
        request.showUserList()
    }
}

