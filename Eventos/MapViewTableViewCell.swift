//
//  MapViewTableViewCell.swift
//  Eventos
//
//  Created by Shamshir on 21/09/17.
//  Copyright © 2017 citrusinformatics. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var mapView: GMSMapView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
//        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
//         mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//        
//        
//        // Creates a marker in the center of the map.
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
//        marker.map = mapView
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
