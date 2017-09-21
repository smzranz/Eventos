//
//  StudioDetailHomeViewController.swift
//  Eventos
//
//  Created by Shamshir on 19/09/17.
//  Copyright © 2017 citrusinformatics. All rights reserved.
//

import UIKit
import GoogleMaps
import FontAwesome_swift

class StudioDetailHomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    @IBOutlet var detailTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
detailTableView.rowHeight = UITableViewAutomaticDimension
        detailTableView.estimatedRowHeight = 80
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath) as! PlaceDetailsTableViewCell
            cell.PlaceDetailImageView.image = UIImage.fontAwesomeIcon(name: .mapMarker, textColor: UIColor.lightGray, size: cell.PlaceDetailImageView.frame.size)
            cell.detaillabel.text = "Address"
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "mapView", for: indexPath) as! MapViewTableViewCell
            
            let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude:-33.86, longitude: 151.20, zoom: 15.0)
            cell.mapView.camera = camera
            let position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
            let marker = GMSMarker(position: position)
            //  marker.icon = #imageLiteral(resourceName: "location")
            
          //  marker.icon = GMSMarker.markerImage(with: colorObject.getPrimaryColor())
            
           // marker.title = placeName
            marker.map = cell.mapView
            
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "aboutUs", for: indexPath) as! AbousUsTableViewCell
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "reviewCell", for: indexPath) as! ReviewsTableViewCell
            return cell
        default:
            return UITableViewCell()
            
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 40
        case 1:
            return 160
        case 2:
            return UITableViewAutomaticDimension
        case 3:
            return UITableViewAutomaticDimension
        default:
            return 40
        }
    }
    

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
        
        return 0
        }
       return 30
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! CustomHeaderTableViewCell
       
        
        
        switch (section) {
        case 0:
            headerCell.headerLabel.text = "Location";
        //return sectionHeaderView
        case 1:
            headerCell.headerLabel.text = "About";
        case 2:
            headerCell.headerLabel.text = "About"
        //return sectionHeaderView
        case 3:
            headerCell.headerLabel.text = "Reviews";
        //return sectionHeaderView
        default: break
            
        }
        
        return headerCell
    }

}
