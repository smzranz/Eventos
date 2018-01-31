//
//  FavoritedViewController.swift
//  Eventos
//
//  Created by Shamshir on 31/01/18.
//  Copyright © 2018 citrusinformatics. All rights reserved.
//

import UIKit
import StatusAlert
class FavoritedViewController:UIViewController ,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var listTableView: UITableView!
    
    
    
    
    
    var showFavourite = [Bool]()
    var showAssured = [Bool]()
    var address = [String]()
    var studioName = [String]()
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        address = ["The Nursery, King's Stanley, Stonehouse GL10, UK","19 Oxford St Market Rasen LN8",
                   "48 Lancaster Rd, Great Yarmouth NR30 2NQ, UK"]
        studioName = ["Openlane",
                      "Yearin",
                      "Goodsilron"]
       
        
        
        showFavourite = [true,true,false,true,false,false,true,false,true,false,false,true,false,false,false]
        
        
        
        
        
        
        
        
        
      
        
   
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studioName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listViewCell", for: indexPath) as! ListViewTableViewCell
        print("Loaded")
        cell.bgView.layer.cornerRadius = 5
        cell.bgView.layer.masksToBounds = true
        cell.coverImage.image = UIImage(named: "\(indexPath.row+1)")
        cell.placeLabel.text = address[indexPath.row]
        cell.titleName.text = studioName[indexPath.row]
        cell.favariteBtn.addTarget(self, action: #selector(favourited), for: .touchUpInside)
       
            
            cell.favariteBtn.setImage(#imageLiteral(resourceName: "hearts_filled"), for: .normal)
       
        cell.placeLabel.sizeToFit()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        listTableView.reloadData()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"sliderSegmentViewController") as! SliderSegmentViewController
        viewController.studioName = studioName[indexPath.row]
        viewController.studioAdress = address[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    var favouritedView : BookMarkedView!
    func favourited(){
        
        
        let statusAlert = StatusAlert.instantiate(withImage: #imageLiteral(resourceName: "hearts_filled"),title: "Removed",message: "Removed from favourited list.",canBePickedOrDismissed: true)
        statusAlert.showInKeyWindow()

        
    }
    
    func removefavouritedView(){
        
        favouritedView.removeFromSuperview()
    }
  
   
        
        
        
        
        
        
    
    
    @IBAction func backBtnAction(_ sender: Any) {
        
         self.dismiss(animated: true, completion: nil)
}
}
