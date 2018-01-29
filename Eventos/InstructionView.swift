
import UIKit

class InstructionView: UIViewController
{
  
  var pageIndex : Int = 0
  
  var imageFile = UIImage()
    var myImageView = UIImageView()
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    let value = UIInterfaceOrientation.landscapeLeft.rawValue
    UIDevice.current.setValue(value, forKey: "orientation")
    myImageView.frame = view.frame
    myImageView.contentMode = .scaleAspectFit
    view.addSubview(myImageView)
    myImageView.image = imageFile
  //  view.backgroundColor = UIColor(patternImage:  imageFile)
    
   
  }
    private func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscapeLeft
    }
    private func shouldAutorotate() -> Bool {
        return true
    }
  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
  }
    
  func Action(button: UIButton)
  {
    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 6, initialSpringVelocity: 4, options: [], animations: {
      button.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
    }, completion: nil)
    
    UIView.animate(withDuration: 0.5, delay: 0.6, usingSpringWithDamping: 2, initialSpringVelocity: 10, options: [], animations: {
        button.transform = CGAffineTransform.identity
    }, completion: nil)
  }
  
}
