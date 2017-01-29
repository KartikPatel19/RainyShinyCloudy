//
//  ViewController.swift
//  RainyShinyCloudy
//
//  Created by kartik on 1/26/17.
//  Copyright © 2017 kartik. All rights reserved.
//

import UIKit

class WhetherVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    //UpperSide Container
    @IBOutlet weak var DateLable: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var currentWhetherImg: UIImageView!
    @IBOutlet weak var currentWhetherTypeLable: UILabel!
    
    //TableView
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate=self
        tableView.dataSource=self
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "whetherCell", for: indexPath)
        
        return cell
    }

    

}

