//
//  MoviesTableViewController.swift
//  Lab2
//
//  Created by Viachaslau on 5/24/19.
//  Copyright © 2019 tresdosdos. All rights reserved.
//

import UIKit
import CoreData

class MoviesTableViewController: UITableViewController {

    var movieResponse: MovieRes? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    
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
                self.movieResponse = response
                self.tableView.reloadData()
                //guard let jsonArr = jsonResponse as? MovieRes else {
                //    print("parsing err")
                //    return
                //}
                //guard let totalResults = jsonArr.totalResults else {return}
                //print(totalResults)
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        
        task.resume()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movieResponse?.Search?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movie", for: indexPath)
        guard let movieCell = cell as? MovieTableViewCell else { return cell }
        // Configure the cell...
        movieCell.setTitle(title: movieResponse?.Search?[indexPath.row].Title)
        return movieCell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
