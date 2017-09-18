//
//  ListViewViewController.swift
//  Eventos
//
//  Created by Shamshir on 15/09/17.
//  Copyright © 2017 citrusinformatics. All rights reserved.
//

import UIKit

class ListViewViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
var address = [String]()
    var studioName = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
//print("Loaded")
        address = ["The Nursery, King's Stanley, Stonehouse GL10, UK","19 Oxford St Market Rasen LN8 3AJ,UK","25-34 Plymouth Rd, Barnt Green, Birmingham B45 8JF, UK",
                   "31 Cottage Ln, Ormskirk L39 3NE, UK",
                   "5 Gannet Cl, Brockworth, Gloucester GL3 4UT, UK",
                   "85 Willoughby St, Muthill, Crieff PH5 2AE, UK",
                   "290 Poulton Rd, Wallasey CH44 4DB, UK",
                   "48 Lancaster Rd, Great Yarmouth NR30 2NQ, UK",
                   "3 Byron Ct, Balderton, Newark NG24 3PY, UK",
                   "Moat Ln, Prestwood, Great Missenden HP16 9BY, UK",
                   "A95, Ballindalloch AB37 9AA, UK",
                   "1 Munro Ct, Clydebank G81 6ES, UK",
                   "1 Westmill Cottages, Watchfield, Swindon SN6 8TH, UK",
                   "2 Victoria Gardens, Cradley Heath B64 5LX, UK",
                   "8 Martins Cl, Ferndown BH22 9SH, UK","1 Munro Ct, Clydebank G81 6ES, UK","1 Munro Ct, Clydebank G81 6ES, UK"]
        
        studioName = ["Openlane",
                      "Yearin",
                      "Goodsilron",
                      "Condax",
                      "Opentech",
                      "Golddex",
                      "year-job",
                      "Isdom",
                      "Gogozoom",
                      "Y-corporation",
                      "Nam-zim",
                      "Donquadtech",
                      "Warephase",
                      "Donware",
                      "Faxquote",
                      "Sunnamplex",
                      "Lexiqvolax"]
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
        return 14
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listViewCell", for: indexPath) as! ListViewTableViewCell
        print("Loaded")
        cell.bgView.layer.cornerRadius = 5
        cell.bgView.layer.masksToBounds = true
        cell.coverImage.image = UIImage(named: "\(indexPath.row+1)")
        cell.placeLabel.text = address[indexPath.row]
        cell.titleName.text = studioName[indexPath.row]
        return cell
    }
}
