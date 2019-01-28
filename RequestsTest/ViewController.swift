//
//  ViewController.swift
//  RequestsTest
//
//  Created by Ekaterina Kozlova on 28.01.2019.
//  Copyright © 2019 Ekaterina Kozlova. All rights reserved.
//

import UIKit


class ViewController: UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createNewSession()
    }
    
    func createNewSession()
    {
        guard let url = URL(string: "https://bnet.i-partner.ru/testAPI/") else { return }
        let parameters = ["a":"new_session"]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("token", forHTTPHeaderField: "cZl7kQI-8H-H4HQhWc")
        //request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error)  in
            if let response = response
            {
                print(response)
            }
            guard let data = data else { return }
            do
            {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            }
            catch
            {
                print(error)
            }
        }.resume()
    }

}

