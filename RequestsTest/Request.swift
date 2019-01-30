//
//  Request.swift
//  RequestsTest
//
//  Created by Ekaterina Kozlova on 29.01.2019.
//  Copyright © 2019 Ekaterina Kozlova. All rights reserved.
//

import Foundation

struct newSessionAnswer: Codable
{
    var data: dataStruct
    var status: Int
}

struct dataStruct: Codable
{
    var session: String
}

struct userList: Codable
{
    var data: [[userEntry]]
    var status: Int
}

struct userEntry: Codable
{
    var body: String
    var da: String
    var dm: String
    var id: String
}

class Request
{
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
                print("sessionId = \(sessionId)")
            }
            catch
            {
                print(error)
            }
            }.resume()
    }
    
    func addEntry(bodyStr: String)
    {
        guard let url = URL(string: "https://bnet.i-partner.ru/testAPI/") else { return }
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let requestStr = "a=add_entry&session=" + sessionId + "&body=" + bodyStr
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
                let answer = try JSONDecoder().decode(userList.self, from: data)
                print("Parsed user list:")
                print(answer)
                let numberOfElements = answer.data[0].count
                print("num of elements = \(numberOfElements)")
                for i in 0...numberOfElements-1
                {
                    daArray.append(answer.data[0][i].da)
                    dmArray.append(answer.data[0][i].dm)
                    bodyArray.append(answer.data[0][i].body)
                }
                print(daArray)
                //print(answer.data[0][0].body)
                //print(answer.data[0].count)
                
            }
            catch
            {
                print(error)
            }
            }.resume()
    }
    
}
