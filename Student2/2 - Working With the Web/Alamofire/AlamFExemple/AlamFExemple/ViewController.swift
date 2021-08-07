//
//  ViewController.swift
//  AlamFExemple
//
//  Created by Wolfpack Digital on 07/08/2021.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    struct Mockable: Codable {
        let id: Int
        let description: String
        let price: Int
        let deliver_to: Deliver
        let image_url: String
        let status: String
    }
    
    struct Deliver: Codable {
        let name: String
        let address: String
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestsExemple3()
    }
    
    // http request with JSON handled succe + failure
    func requestsExemple1() {
        AF.request("https://demo2881349.mockable.io/").responseJSON { response in
            switch response.result {
            case .success(let data):
                var myResults: [Any] = []
                if let foods = data as? [[String: Any]] {
                    for food in foods {
                        myResults.append(food)
                    }
                print(myResults)
                }
            case .failure(let error):
                print("Something went wrong: \(error)")
            }
            //debugPrint(response.result)
        }
    }
    
    // http request with Codable
    func requestsExemple2() {
        AF.request("https://demo2881349.mockable.io/").responseDecodable(of: [Mockable].self) { response in
            switch response.result {
            case .success(let data):
                for elem in data {
                    print(elem)
                }
            case .failure(let error):
                print("Something went wrong: \(error)")
            }
        }
    }
    
    // http request food page
    func requestsExemple3() {
        let url = "https://www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata"
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let data):
                print(data)
                /*
                var myResults: [Any] = []
                if let foods = data as? [[String: Any]] {
                    for food in foods {
                        myResults.append(food)
                    }
                    print(myResults)
                }
                */
            case .failure(let error):
                print("Something went wrong: \(error)")
            }
        }
    }

}
