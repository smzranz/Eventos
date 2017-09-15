//
//  ListViewViewController.swift
//  Eventos
//
//  Created by Shamshir on 15/09/17.
//  Copyright © 2017 citrusinformatics. All rights reserved.
//

import UIKit

class ListViewViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
//print("Loaded")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listViewCell", for: indexPath) as! ListViewTableViewCell
        print("Loaded")
        cell.bgView.layer.cornerRadius = 5
        cell.bgView.layer.masksToBounds = true
        
        return cell
    }
}
