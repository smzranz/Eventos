//
//  SliderSegmentViewController.swift
//  Eventos
//
//  Created by Shamshir on 22/09/17.
//  Copyright © 2017 citrusinformatics. All rights reserved.
//

import UIKit
import GoogleMaps
import FontAwesome_swift
import Hero

class SliderSegmentViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate {
    
    
    
    
    var packages = [String]()
    var packagesTitle = [String]()
    
    var studioName = ""
    var studioAdress = ""
    
    var colorObject = ColorFile()
    
    @IBOutlet weak var navBar: UIView!
    @IBOutlet var enquireBtnOutle: UIButton!
    
    @IBOutlet var navTitle: UILabel!
    
    var selectedImageIndex : IndexPath!
    var currentIndex = 0
    
    var sliderTitle = [String]()
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    
    @IBOutlet weak var segmentCollectionView: UICollectionView!
    
//    override func viewWillAppear(_ animated: Bool) {
//        UIApplication.shared.isStatusBarHidden = true
//       //  navigationController?.navigationBar.isHidden = false
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.backgroundColor = colorObject.getPrimaryColor()
        sliderCollectionView.backgroundColor = colorObject.getPrimaryColor()
        packagesTitle = ["Platinum","Diamond","Gold","Silver"]
        packages = ["No.of photographer : 1 photographer\n\nNo.of videographer : 1 videographer\n\nNumber of photos : 300\n\nNumber of Camera : 1\n\nCamera : DSLR \n\nCameraAlbum : 40 Sheet (long-lasting and non-tearable synthetic)\n\nVideo:Edited video output deliverey on a Blu-ray\n\nVideo camera : Standard video camera","No.of photographer : 1 photographer\n\nNo.of videographer : 1 videographer\n\nNumber of photos : 350\n\nNumber of Camera : 1\n\nCamera : Canon 5D Mark III or Full Frame HD Camera \n\nCameraAlbum : 50 Sheet (long-lasting and non-tearable synthetic)\n\nVideo:Edited video output deliverey on a Blu-ray\n\nVideo camera : Sony PMW 200 or similar Full HD Camera","No.of photographer : 2 photographer\n\nNo.of videographer : 2 videographer\n\nNumber of photos : 600\n\nNumber of Camera : 1\n\nCamera : Canon 5D Mark III or Full Frame HD Camera \n\nCameraAlbum : 100 Sheet (long-lasting and non-tearable synthetic)\n\nVideo:Edited video output deliverey on a Blu-ray\n\nVideo camera : Sony PMW 200 or similar Full HD Camera\n\nExclusive candid shoot:YES\n\nLarge TV screens:2 large TV screens","No.of photographer : 2 photographer\n\nNo.of videographer : 2 videographer\n\nNumber of photos : 600\n\nNumber of Camera : 1\n\nCamera : Canon 5D Mark III or Full Frame HD Camera \n\nCameraAlbum : 100 Sheet (long-lasting and non-tearable synthetic)\n\nVideo:Edited video output deliverey on a Blu-ray\n\nVideo camera : Sony PMW 200 or similar Full HD Camera\n\nExclusive candid shoot:YES\n\nLarge TV screens:2 large TV screens"]
      //  setSharebtn()
      //  UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        self.navTitle.text = studioName
        enquireBtnOutle.tintColor = UIColor.white
        enquireBtnOutle.backgroundColor = colorObject.getPrimaryColor()
      //  enquireBtnOutle.backgroundColor = ColorFile().getPrimaryColor()
     //   enquireBtnOutle.setTitle("enquire", for: .normal)
        enquireBtnOutle.setImage(UIImage.fontAwesomeIcon(name: .ticket, textColor: .white, size: CGSize(width: 30, height: 30)), for: .normal)
       // setBackButton()
      sliderTitle =  ["Summary", "Demos","Packages","Login"]
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView.tag == 101 {
        return 2
        
        }
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 101 {
            return 9
            
        }
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == sliderCollectionView{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCell", for: indexPath) as! SliderCollectionViewCell
            cell.backgroundColor = ColorFile().getPrimaryColor()
           // 3.0 are the seconds
                
                // Write your code here for e.g. Increasing any Subviews height.
                
           //     self.view.layoutIfNeeded()
                
           cell.sliderLabel.text = sliderTitle[indexPath.row]
            cell.sliderLabel.textColor = UIColor.white
                //ColorFile().getMarkerBlueColor()
            if indexPath.row == self.currentIndex{
            cell.bottomView.backgroundColor = UIColor.white
                //ColorFile().getMarkerBlueColor()
            cell.heightConstrain.constant = 4
            
            }else{
            cell.heightConstrain.constant = 2
            cell.bottomView.backgroundColor = ColorFile().getPrimaryColor()
            cell.sliderLabel.textColor = UIColor.white
                //ColorFile().getMarkerBlueColor().withAlphaComponent(0.7)
            }
       
        return cell
    }
        if collectionView == segmentCollectionView{
            if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "segmentCell", for: indexPath) as! SegmentCollectionViewCell
            
           cell.detailTableView.tag = 100
             cell.detailTableView.rowHeight = UITableViewAutomaticDimension
             cell.detailTableView.estimatedRowHeight = 80
            return cell
            }else if indexPath.row == 1 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "segmentCell2", for: indexPath) as! DemoSegmentCollectionViewCell
                
                cell.demoImageCollectionView.tag = 101
                
                return cell
            }else  if indexPath.row == 2 {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "segmentCell3", for: indexPath) as! PackageCollectionViewCell
                
                cell.packagesTableView.tag = 102
              //  cell.packagesTableView.reloadData()
                cell.packagesTableView.rowHeight = UITableViewAutomaticDimension
                cell.packagesTableView.estimatedRowHeight = 80
                
                return cell
            }else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "segmentCell4", for: indexPath) as! LoginCollectionViewCell
                
                
                cell.myAlbumBtn.layer.cornerRadius = cell.myAlbumBtn.frame.height/2
                cell.myAlbumBtn.layer.borderWidth = 1
                cell.myAlbumBtn.layer.borderColor = UIColor.lightGray.cgColor
                cell.myAlbumBtn.layer.masksToBounds = true
                cell.myAlbumBtn.addTarget(self, action: #selector(albumSelectedAction), for: .touchUpInside)
                
                cell.selectionBtn.layer.cornerRadius = cell.selectionBtn.frame.height/2
                cell.selectionBtn.layer.borderWidth = 1
                cell.selectionBtn.layer.borderColor = UIColor.lightGray.cgColor
                cell.selectionBtn.layer.masksToBounds = true
                
                return cell
            }
        }
        
        if collectionView.tag == 101{
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ListImageCollectionViewCell
            cell.demoImageView.image = UIImage(named: "\(indexPath.row+1)")
            cell.demoImageView.heroID = "image_\(indexPath)"
            cell.demoImageView.heroModifiers = [.zPosition(2)]
         //   cell.demoImageView.heroModifiers = [.fade, .scale(0.8)]
            if indexPath.section == 1{
                cell.videoCamera.image = UIImage.fontAwesomeIcon(name:.videoCamera , textColor: UIColor.white, size: cell.videoCamera.frame.size)
                //UIImage.fontAwesomeIcon(code: .vimeoSquare, textColor: UIColor.white, size: cell.videoCamera.frame.size)
                cell.videoCamera.isHidden = false
            }else{
                cell.videoCamera.isHidden = true
                
            }
            return cell
        
        
        }
        
        return UICollectionViewCell()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == sliderCollectionView{
        
         self.segmentCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        }
        if collectionView.tag == 101{
            if indexPath.section == 0{
            selectedImageIndex = indexPath
            
            performSegue(withIdentifier: "toDetailImage", sender: self)
            }else{
                
                performSegue(withIdentifier: "toPlayVideo", sender: self)
                
            }
        }
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == sliderCollectionView{
        
        return CGSize(width: (collectionView.frame.size.width)/4, height: 30)
        
        }
        if collectionView.tag == 101{
        
        return CGSize(width: (collectionView.frame.size.width-3)/3, height: (collectionView.frame.size.width-3)/3)
        
        }
        
        return CGSize(width: collectionView.frame.size.width, height: (collectionView.frame.size.height))
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView.tag == 101{
        
        return 1
        }
        return 0
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //   if indexPath.section == 1{
        
        if collectionView.tag == 101{
        if indexPath.section == 0{
            
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeaderCollectionReusableView
            
            header.label.text = "Photos"
            // header.label.layer.cornerRadius = 3
            header.label.textColor = UIColor.black
            header.viewAll.addTarget(self, action: #selector(viewAllPressed), for: .touchUpInside)
            //   header.label.layer.borderWidth = 1
            header.label.layer.masksToBounds = true
            
            return header
        }
        else if indexPath.section == 1{
            
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeaderCollectionReusableView
            
            header.label.text = "Videos"
            //   header.label.layer.cornerRadius = 3
            header.label.textColor = UIColor.black
            //    header.label.layer.borderWidth = 1
            header.label.layer.masksToBounds = true
            return header
            
        }
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeaderCollectionReusableView
        
        header.label.text = "xx"
        
        return header
        }
        return UICollectionReusableView ()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
         if collectionView.tag == 101{
        return CGSize(width: 300, height: 40)
        }
        return CGSize(width: 0, height: 0)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailImage" {
            let destView = segue.destination as! DetailImageViewViewController
            //  destView.photoArray = photoReference
            destView.selectedImageIndex = selectedImageIndex
            
        }
    }
    

    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView == segmentCollectionView{
            var visibleRect = CGRect()
          
                visibleRect.origin = segmentCollectionView.contentOffset
                visibleRect.size = segmentCollectionView.bounds.size
                
                let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
                
                let visibleIndexPath: IndexPath = segmentCollectionView.indexPathForItem(at: visiblePoint)!
                currentIndex = visibleIndexPath.row
           // if scrollView == segmentCollectionView{
                UIView.transition(with: sliderCollectionView,
                                  duration: 0.0,
                                  options: .transitionCrossDissolve,
                                  animations: {
                                    self.sliderCollectionView.reloadSections([0])
                                    // currentIndex = index
                })
           // }
//              UIView.animate(withDuration: 0.25, animations: {
//                                self.sliderCollectionView.reloadSections([0])
//                                // currentIndex = index
//            })
        
        
    }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
       
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView.tag == 102{
        return 1
        
        }
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if tableView.tag == 102{
            return 4
            
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView.tag == 102{
        
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "packagesCell", for: indexPath) as! PackagesTableViewCell
           
            cell.descriptionLabel.text = packages[indexPath.row]
            cell.titleLabel.text = packagesTitle[indexPath.row]
            return cell
        
        
        
        }else{
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath) as! PlaceDetailsTableViewCell
            cell.PlaceDetailImageView.image = UIImage.fontAwesomeIcon(name: .mapMarker, textColor: UIColor.lightGray, size: cell.PlaceDetailImageView.frame.size)
            cell.detaillabel.text = studioAdress
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
            cell.mapView.layer.cornerRadius = 5
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "aboutUs", for: indexPath) as! AbousUsTableViewCell
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "reviewCell", for: indexPath) as! ReviewsTableViewCell
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "socialCell", for: indexPath) as! SocialMediaTableViewCell
            return cell
        default:
            return UITableViewCell()
            
        }
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView.tag == 102{
        
            tableView.estimatedRowHeight = 60
            return UITableViewAutomaticDimension
        
        }else{
        switch indexPath.section {
        case 0:
            return 40
        case 1:
            return 160
        case 2:
            return UITableViewAutomaticDimension
        case 3:
            return (self.view.frame.width-125)/4

        case 4:
            return UITableViewAutomaticDimension
        default:
            return 40
        }
        }
       // return 40
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView.tag == 102{
            
            tableView.estimatedRowHeight = 60
            return UITableViewAutomaticDimension
            
        }else{
        if section == 1 {
            
            return 0
        }
        return 30
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView.tag == 102{
            
            
            return nil
            
        }else{
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
            headerCell.headerLabel.text = "Social";
        case 4:
            headerCell.headerLabel.text = "Reviews";
        //return sectionHeaderView
        default: break
            
        }
        
        return headerCell
        }
    }
    
    func albumSelectedAction(){
        let alert = UIAlertController(title: "Album key", message: "Please enter the private ablum key", preferredStyle:
            UIAlertControllerStyle.alert)
        
        alert.addTextField(configurationHandler: textFieldHandler)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            DispatchQueue.main.async {
                let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let vc : FolderViewViewController = storyboard.instantiateViewController(withIdentifier: "folderViewViewController") as! FolderViewViewController
                
                
                let navigationController = UINavigationController(rootViewController: vc)
               // navigationController.navigationBar.isTranslucent = false
                self.navigationController?.pushViewController(vc, animated: true)
//                self.present(navigationController, animated: true, completion: nil)
            }
            
        }))
        
        self.present(alert, animated: true, completion:nil)
    }
    func textFieldHandler(textField: UITextField!)
    {
        print(textField.text)
        if (textField) != nil {
            textField.placeholder = "Foo!"
            textField.text = ""
        }
    }
    @IBAction func enquiryBtnAction(_ sender: Any) {
        
        showEnquiryView()
        
    }
    var enquiryView : SendEnquiryWindow!
    let datePicker = UIDatePicker()
    func showEnquiryView(){
        let win:UIWindow = UIApplication.shared.delegate!.window!!
        enquiryView = Bundle.main.loadNibNamed("SendEnquiry", owner: self, options: nil)?.first! as! SendEnquiryWindow
        enquiryView.frame = win.frame
        
        datePicker.datePickerMode = UIDatePickerMode.date
        enquiryView.dateTxt.inputView = datePicker
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: UIControlEvents.valueChanged)
        enquiryView.sendBtn.layer.cornerRadius = 8
        enquiryView.topImageView.layer.cornerRadius = enquiryView.topImageView.frame.height/2
        enquiryView.topImageView.layer.borderColor = UIColor.white.cgColor
        enquiryView.topImageView.layer.borderWidth = 2
        enquiryView.sendBtn.addTarget(self, action: #selector(sendFeedbackAction), for: .touchUpInside)
        view.addSubview(enquiryView)
        
      
    }

    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        dateFormatter.timeStyle = DateFormatter.Style.none
        
        enquiryView.dateTxt.text = dateFormatter.string(from: sender.date)
        
    }
    func sendFeedbackAction(){
    
    enquiryView.removeFromSuperview()
    }
    func setSharebtn(){
        
        
        let btn = UIButton(type: .custom)
        btn.tintColor = UIColor.white
        btn.setImage((#imageLiteral(resourceName: "share")), for: .normal)
        btn.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 5)
        // btn.imageEdgeInsets.left = -40
        btn.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        btn.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
        //   btn.backgroundColor = UIColor.white
        let item = UIBarButtonItem(customView: btn)
        
        self.navigationItem.setRightBarButton(item, animated: true)
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        
        backBtnTapped()
    }
    
    
    func viewAllPressed(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"viewAllViewController") as! ViewAllViewController
      
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
}
