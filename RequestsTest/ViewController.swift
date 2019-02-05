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
var idSession: String?

class ViewController: UIViewController, RequestDelegate, UITableViewDataSource, UITableViewDelegate
{
    func getSession(session: String)
    {
        DispatchQueue.main.async
        {
            sessionId = session
            idSession = sessionId
            UserDefaults.standard.set(sessionId, forKey: "idSession")
            UserDefaults.standard.set(true, forKey: "launchedBefore")
            print(sessionId)
        }
    }
    
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
        let numberOfSymbols = bodyArray[indexPath.row].count
        let temp = bodyArray[indexPath.row]
        var index: String.Index
        if numberOfSymbols < 200
        {
            index = temp.index(temp.startIndex, offsetBy: numberOfSymbols)
        }
        else
        {
            index = temp.index(temp.startIndex, offsetBy: 200)
        }
        cell.entryLabel.text = String(temp[..<index])
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //tableView.rowHeight = UITableView.automaticDimension
        tableView.rowHeight = 100
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        idSession = UserDefaults.standard.string(forKey: "idSession")
        if launchedBefore
        {
            //sessionId = UserDefaults.standard.string(forKey: "idSession")
            sessionId = UserDefaults.standard.string(forKey: "idSession")!
            print(sessionId)
        }
        else
        {
            request.createNewSession()
        }
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
            alertController.addAction(UIAlertAction(title: "Обновить", style: .default, handler: {(action: UIAlertAction) -> Void in request.showUserList()}))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func showUserListButtonTapped(_ sender: UIButton)
    {
        request.showUserList()
    }
}

