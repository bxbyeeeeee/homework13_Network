//
//  CityTableViewController.swift
//  bxbNetwork
//
//  Created by student on 2018/12/18.
//  Copyright © 2018年 baoxinbei. All rights reserved.
//

import UIKit
import Alamofire

class CityTableViewController: UITableViewController {

    var cityURL : [String]?
    var allCity : [String]?
    var cityInfo : [String : Any]?
    override func viewDidLoad() {
        super.viewDidLoad()
        cityURL = ["http://t.weather.sojson.com/api/weather/city/101270101","http://t.weather.sojson.com/api/weather/city/101010100","http://t.weather.sojson.com/api/weather/city/101030100","http://t.weather.sojson.com/api/weather/city/101020100"]
        allCity = ["成都","北京","天津","上海"]
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (allCity?.count)!
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = allCity![indexPath.row]

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = cityURL![indexPath.row]
        AF.request(url).responseJSON { (response) in
            self.cityInfo = response.value as? [String:Any]
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "ShowCity", sender: self)
            }
        }
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowCity" {
            if let secVC = segue.destination as? ViewController {
                secVC.cityInfo = self.cityInfo
            }
        }
    }
    

}
