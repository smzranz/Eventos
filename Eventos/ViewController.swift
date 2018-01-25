





import Foundation
import UIKit
import GooglePlaces
import Hero




class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,APKenBurnsViewDataSource {
    
    
    @IBOutlet weak var animationBgView: APKenBurnsView!
    
    private var index: Int = 0
    var dataSource = [String]()
    
    
   @IBOutlet var listTableView: UITableView!
    var address = [String]()
    var studioName = [String]()
    
    @IBOutlet weak var searchBtnOutlet: UIButton!
    
    
    @IBOutlet weak var placeNameBtnOutlet: UIButton!
    
    // Present the Autocomplete view controller when the button is pressed.
    @IBAction func autocompleteClicked(_ sender: UIButton) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.tableCellBackgroundColor = UIColor.white
     //   autocompleteController.
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        dataSource = ["family1", "family2", "nature1", "nature2"]
        animationBgView.dataSource = self
        animationBgView.faceRecognitionMode = .Group
//        animationBgView.scaleFactorDeviation = 0.5
//        animationBgView.imageAnimationDuration = 5.0
//        animationBgView.imageAnimationDurationDeviation = 1.0
//        animationBgView.transitionAnimationDuration = 2.0
//        animationBgView.transitionAnimationDurationDeviation = 1.0
        
        
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
        
  //  geoFire()
    }
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
       // self.animationBgView.startAnimations()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return address.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listViewCell", for: indexPath) as! ListViewTableViewCell
        print("Loaded")
        cell.coverImage.heroID = "coverImage"
        cell.bgView.layer.cornerRadius = 5
        cell.bgView.layer.masksToBounds = true
        cell.coverImage.layer.cornerRadius = 5
        cell.coverImage.layer.masksToBounds = true
        cell.coverImage.image = UIImage(named: "\(indexPath.row+1)")
        cell.placeLabel.text = address[indexPath.row]
        cell.titleName.text = studioName[indexPath.row]
       
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 75
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
            let  headerCell = tableView.dequeueReusableCell(withIdentifier: "searchCell") as! SearchHeaderTableViewCell
            
            
            
        
                
            
            
            return headerCell
        
    }
    

    
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
//    func geoFire(){
//        let geofireRef = Database.database().reference(fromURL: "https://eventosapplive.firebaseio.com/studios/-KjvM56sgdsgdsrwrewr")
//        let geoFire = GeoFire(firebaseRef: geofireRef)
//       
//      //  geofireRef.setLocation(location, forKey: "studio_nc")
//      //  geoFire?.setLocation(CLLocation(latitude: 37.7832889, longitude: -122.4056973), forKey: "firebase-hq")
//        
//        
//        
//        let center = CLLocation(latitude: 37.7832889, longitude: -122.4056973)
//        // Query locations at [37.7832889, -122.4056973] with a radius of 600 meters
//        let circleQuery = geoFire?.query(at: center, withRadius: 0.6)
//        
//        _ = circleQuery?.observe(.keyEntered, with: { (key: String!, location: CLLocation!) in
//            print("Key '\(key)' entered the search area and is at location '\(location)'")
//        })
//    }
    
    
    
    @IBAction func searchAction(_ sender: Any) {
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier :"listViewViewController") as! ListViewViewController
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func nextImageForKenBurnsView(kenBurnsView: APKenBurnsView) -> UIImage? {
        let image = UIImage(named: dataSource[index])
        index = index == dataSource.count - 1 ? 0 : index + 1
        return image
    }
}

extension ViewController: GMSAutocompleteViewControllerDelegate {
    
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        self.placeNameBtnOutlet.setTitle(place.name, for: .normal)
    
       
       let location = CLLocation(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude)
        // geoFire(location: location)
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // User canceled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
}

extension UIColor {
    func brightened(by factor: CGFloat) -> UIColor {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        return UIColor(hue: h, saturation: s, brightness: b * factor, alpha: a)
    }
}


extension UIViewController {
    
    func setBackButton(){
        
        let btn = UIButton(type: .custom)
        btn.tintColor = UIColor.white
        btn.setImage(UIImage.fontAwesomeIcon(name:.angleLeft, textColor: UIColor.white, size: CGSize(width: 50, height: 50)), for: .normal)
        btn.imageEdgeInsets.left = -40
        btn.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        btn.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
      //   btn.backgroundColor = UIColor.white
        let item = UIBarButtonItem(customView: btn)
        
        self.navigationItem.setLeftBarButton(item, animated: true)
        
    }
    func backBtnTapped() {
     //   self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationController?.popViewController(animated: true)
        
        
    }
}
extension UINavigationController {
    
    public func presentTransparentNavigationBar() {
        navigationBar.setBackgroundImage(UIImage(), for:UIBarMetrics.default)
        navigationBar.isTranslucent = true
        navigationBar.shadowImage = UIImage()
        setNavigationBarHidden(false, animated:true)
    }
    
    public func hideTransparentNavigationBar() {
        setNavigationBarHidden(true, animated:false)
        navigationBar.setBackgroundImage(UINavigationBar.appearance().backgroundImage(for: UIBarMetrics.default), for:UIBarMetrics.default)
        navigationBar.isTranslucent = UINavigationBar.appearance().isTranslucent
        navigationBar.shadowImage = UINavigationBar.appearance().shadowImage
    }
}
