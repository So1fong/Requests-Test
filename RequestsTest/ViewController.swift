//
//  ViewController.swift
//  RequestsTest
//
//  Created by Ekaterina Kozlova on 28.01.2019.
//  Copyright © 2019 Ekaterina Kozlova. All rights reserved.
//

import UIKit

struct newSessionAnswer: Codable
{
    var data: dataStruct
    var status: Int
}

struct dataStruct: Codable
{
    var session: String
}

var sessionId: String = ""

class ViewController: UIViewController
{

    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        createNewSession()
        showUserList()
    }
    
    func createNewSession()
    {
        guard let url = URL(string: "https://bnet.i-partner.ru/testAPI/") else { return }
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let requestStr = "a=new_session"
        request.httpBody = requestStr.data(using: .utf8)
        request.addValue("cZl7kQI-8H-H4HQhWc", forHTTPHeaderField: "token")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        session.dataTask(with: request) { (data, response, error)  in
            guard let data = data else { return }
            do
            {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
                let answer = try JSONDecoder().decode(newSessionAnswer.self, from: data)
                print("Parsed:")
                print(answer)
                let str: String = answer.data.session
                sessionId = str
            }
            catch
            {
                print(error)
            }
        }.resume()
    }
    
    func showUserList()
    {
        guard let url = URL(string: "https://bnet.i-partner.ru/testAPI/") else { return }
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let requestStr = "a=get_entries&session=" + sessionId
        request.httpBody = requestStr.data(using: .utf8)
        request.addValue("cZl7kQI-8H-H4HQhWc", forHTTPHeaderField: "token")
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        session.dataTask(with: request) { (data, response, error)  in
            guard let data = data else { return }
            do
            {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
                //let answer = try JSONDecoder().decode(newSessionAnswer.self, from: data)
                //print("Parsed:")
                //print(answer)
            }
            catch
            {
                print(error)
            }
            }.resume()
    }

}

