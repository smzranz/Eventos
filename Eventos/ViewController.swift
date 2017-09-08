






import UIKit
import GooglePlaces
import FirebaseCore
import FirebaseDatabase


class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var searchBtnOutlet: UIButton!
    
    
    @IBOutlet weak var placeNameBtnOutlet: UIButton!
    
    // Present the Autocomplete view controller when the button is pressed.
    @IBAction func autocompleteClicked(_ sender: UIButton) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.tableCellBackgroundColor = UIColor.red
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
    geoFire()
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
    
    func geoFire(){
        let geofireRef = Database.database().reference(fromURL: "https://eventosapplive.firebaseio.com/studios/-KjvM56sgdsgdsrwrewr")
        let geoFire = GeoFire(firebaseRef: geofireRef)
       
      //  geofireRef.setLocation(location, forKey: "studio_nc")
      //  geoFire?.setLocation(CLLocation(latitude: 37.7832889, longitude: -122.4056973), forKey: "firebase-hq")
        
        
        
        let center = CLLocation(latitude: 37.7832889, longitude: -122.4056973)
        // Query locations at [37.7832889, -122.4056973] with a radius of 600 meters
        let circleQuery = geoFire?.query(at: center, withRadius: 0.6)
        
        _ = circleQuery?.observe(.keyEntered, with: { (key: String!, location: CLLocation!) in
            print("Key '\(key)' entered the search area and is at location '\(location)'")
        })
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
