
import UIKit
import FontAwesome_swift

class InstructionView: UIViewController
{
  
    var pageIndex : Int = 0
    var closebtn = UIButton()
    var imageFile = UIImage()
    var myImageView = UIImageView()
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    closebtn.frame = CGRect(x: 15, y: 15, width: 35, height: 35)
    self.view.addSubview(closebtn)
    closebtn.setImage(UIImage.fontAwesomeIcon(name: .windowClose, textColor: UIColor.black, size: closebtn.frame.size), for: .normal)
    closebtn.tintColor = UIColor.black
//    let value = UIInterfaceOrientation.landscapeLeft.rawValue
//    UIDevice.current.setValue(value, forKey: "orientation")
    myImageView.frame = view.frame
    myImageView.contentMode = .scaleAspectFit
    view.addSubview(myImageView)
    myImageView.image = imageFile
  //  view.backgroundColor = UIColor(patternImage:  imageFile)
    
    closebtn.addTarget(self, action: #selector(Action(button:)), for: .touchUpInside)
    
  }
//    private func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
//        return UIInterfaceOrientationMask.landscapeLeft
//    }
//    private func shouldAutorotate() -> Bool {
//        return true
//    }
  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
  }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    //    AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
        AppUtility.lockOrientation(.all)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Don't forget to reset when view is being removed
        AppUtility.lockOrientation(.portrait)
    }
  func Action(button: UIButton)
  {
    AppUtility.lockOrientation(.portrait)
    navigationController?.popViewController(animated: true)
    
    }
  
}
