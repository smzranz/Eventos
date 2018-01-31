
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
        closebtn.setImage(UIImage.fontAwesomeIcon(name: .windowClose, textColor: UIColor.white, size: closebtn.frame.size), for: .normal)
    closebtn.tintColor = UIColor.white

    myImageView.frame = view.frame
    myImageView.contentMode = .scaleAspectFit
    view.addSubview(myImageView)
    myImageView.image = imageFile
  
    myImageView.backgroundColor = UIColor.black
    closebtn.addTarget(self, action: #selector(Action(button:)), for: .touchUpInside)
    self.view.addSubview(closebtn)

  }

  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
  }
    
  
  func Action(button: UIButton)
  {
    
    navigationController?.popViewController(animated: true)
    
    }
  
}
