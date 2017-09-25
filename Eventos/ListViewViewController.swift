//
//  ListViewViewController.swift
//  Eventos
//
//  Created by Shamshir on 15/09/17.
//  Copyright © 2017 citrusinformatics. All rights reserved.
//

import UIKit


class ListViewViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var listTableView: UITableView!
    
    
    var showFavourite = [Bool]()
    var showAssured = [Bool]()
var address = [String]()
    var studioName = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
//print("Loaded")
        setBackButton()
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
        
        showFavourite = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
        showFavourite = [true,true,false,true,false,false,true,false,true,false,false,true,false,false,false]
        
      //  listTableView.reloadData()
       // listTableView.showLoader()
      //  _ = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(stopLoading), userInfo: nil, repeats: false)
        // Do any additional setup after loading the view.
    }
    func stopLoading(){
    listTableView.hideLoader()
    
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
        cell.favariteBtn.addTarget(self, action: #selector(favourited), for: .touchUpInside)
        if showFavourite[indexPath.row] {
        
        cell.favariteBtn.setImage(#imageLiteral(resourceName: "hearts_filled"), for: .normal)
        }
        else{
        cell.favariteBtn.setImage(#imageLiteral(resourceName: "hearts_outline"), for: .normal)
        }
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
         let win:UIWindow = UIApplication.shared.delegate!.window!!
    favouritedView = Bundle.main.loadNibNamed("BookmarkedView", owner: self, options: nil)?.first! as! BookMarkedView
        favouritedView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        favouritedView.center = win.center
        favouritedView.layer.cornerRadius = 8
        win.addSubview(favouritedView)
        
        _ = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(removefavouritedView), userInfo: nil, repeats: false)
    
    }
    
    func removefavouritedView(){
    
    favouritedView.removeFromSuperview()
    }
 /*
    func placeRating(){
        
        switch RatingArray {
        case 1:
            star1.image=#imageLiteral(resourceName: "start")
            star2.image=#imageLiteral(resourceName: "star_inactive")
            star3.image=#imageLiteral(resourceName: "star_inactive")
            star4.image=#imageLiteral(resourceName: "star_inactive")
            star5.image=#imageLiteral(resourceName: "star_inactive")
        case 2:
            star1.image=#imageLiteral(resourceName: "start")
            star2.image=#imageLiteral(resourceName: "start")
            star3.image=#imageLiteral(resourceName: "star_inactive")
            star4.image=#imageLiteral(resourceName: "star_inactive")
            star5.image=#imageLiteral(resourceName: "star_inactive")
        case 3:
            star1.image=#imageLiteral(resourceName: "start")
            star2.image=#imageLiteral(resourceName: "start")
            star3.image=#imageLiteral(resourceName: "start")
            star4.image=#imageLiteral(resourceName: "star_inactive")
            star5.image=#imageLiteral(resourceName: "star_inactive")
        case 4:
            star1.image=#imageLiteral(resourceName: "start")
            star2.image=#imageLiteral(resourceName: "start")
            star3.image=#imageLiteral(resourceName: "start")
            star4.image=#imageLiteral(resourceName: "start")
            star5.image=#imageLiteral(resourceName: "star_inactive")
        case 5:
            star1.image=#imageLiteral(resourceName: "start")
            star2.image=#imageLiteral(resourceName: "start")
            star3.image=#imageLiteral(resourceName: "start")
            star4.image=#imageLiteral(resourceName: "start")
            star5.image=#imageLiteral(resourceName: "start")
        default:
            star1.image=nil
            star2.image=nil
            star3.image=nil
            star4.image=nil
            star5.image=nil
            
        }
        
        
        
    }
 */
}
