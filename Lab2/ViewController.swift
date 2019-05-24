//
//  ViewController.swift
//  Lab2
//
//  Created by Viachaslau on 5/23/19.
//  Copyright © 2019 tresdosdos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        guard let url = URL(string: "https://omdbapi.com/?apikey=c8d2a36b&s=aaa&page=1") else {return}
        let task = URLSession.shared.dataTask(with: url) {
            (data, res, err) in
            guard let dataRes = data,
                err == nil else {
                    print(err?.localizedDescription ?? "Response error")
                    return
            }
            do {
                //let jsonResponse = try JSONSerialization.jsonObject(with: dataRes, options: [])
                //print(jsonResponse)
                
                let decoder = JSONDecoder()
                let response = try decoder.decode(MovieRes.self, from: dataRes)
                //guard let jsonArr = jsonResponse as? MovieRes else {
                //    print("parsing err")
                //    return
                //}
                print(response)
                //guard let totalResults = jsonArr.totalResults else {return}
                //print(totalResults)
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        
        task.resume()
    }


}

