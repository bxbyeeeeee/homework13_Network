//
//  ViewController.swift
//  bxbNetwork
//
//  Created by student on 2018/12/18.
//  Copyright © 2018年 baoxinbei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var tips: UILabel!
    
    var cityInfo : [String : Any]?
    override func viewDidLoad() {
        super.viewDidLoad()
        let info1 = cityInfo!["cityInfo"] as! [String : String]
        city.text = info1["city"]
        date.text = (cityInfo!["date"] as! String)
        let info3 = cityInfo!["data"] as! [String : Any]
        temp.text = info3["wendu"] as? String
        tips.text = info3["ganmao"] as? String
    }


}

