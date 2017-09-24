//
//  StudioDetailViewController.swift
//  Eventos
//
//  Created by Shamshir on 19/09/17.
//  Copyright © 2017 citrusinformatics. All rights reserved.
//

import UIKit

//import DTPagerController

class StudioDetailViewController: UIViewController  {
    
    
    /// The view controllers to display in the Pageboy view controller.
    ///
    /// - Parameter pageboyViewController: The Pageboy view controller
    /// - Returns: Array of view controllers
   


    override func viewDidLoad() {
        super.viewDidLoad()
        setBackButton()
        setSharebtn()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc3: PackagesViewController! = storyboard.instantiateViewController(withIdentifier: "packagesViewController") as! PackagesViewController
        let vc4: OptionsViewController! = storyboard.instantiateViewController(withIdentifier: "optionsViewController") as! OptionsViewController
        let vc1: StudioDetailHomeViewController! = storyboard.instantiateViewController(withIdentifier: "studioDetailHomeViewController") as! StudioDetailHomeViewController
        let vc2: DemosViewController! = storyboard.instantiateViewController(withIdentifier: "demosViewController") as! DemosViewController
        let slidingContainerViewController = SlidingContainerViewController ( parent: self, contentViewControllers: [vc1, vc2,vc3,vc4],
            titles: ["Detail", "Demos","Packages","Login"])
        
        view.addSubview(slidingContainerViewController.view)
        slidingContainerViewController.sliderView.appearance.outerPadding = 0
        slidingContainerViewController.sliderView.appearance.innerPadding = 50
        slidingContainerViewController.sliderView.appearance.fixedWidth = true
        slidingContainerViewController.sliderView.appearance.backgroundColor = UIColor.white
      //  slidingContainerViewController.sliderView.appearance.selectorColor = UIColor.blue
        slidingContainerViewController.sliderView.appearance.selectedTextColor = ColorFile().getMarkerBlueColor()
        slidingContainerViewController.setCurrentViewControllerAtIndex(0)
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: SlidingContainerViewControllerDelegate
    
    func slidingContainerViewControllerDidMoveToViewController(_ slidingContainerViewController: SlidingContainerViewController, viewController: UIViewController, atIndex: Int) {
        
        
    
        
    }
    
    func slidingContainerViewControllerDidShowSliderView(_ slidingContainerViewController: SlidingContainerViewController) {
        
    }
    
    func slidingContainerViewControllerDidHideSliderView(_ slidingContainerViewController: SlidingContainerViewController) {
        
    }
    
    func setSharebtn(){
    
    
        let btn = UIButton(type: .custom)
        btn.tintColor = UIColor.white
        btn.setImage((#imageLiteral(resourceName: "share")), for: .normal)
       // btn.imageEdgeInsets.left = -40
        btn.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        btn.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
        //   btn.backgroundColor = UIColor.white
        let item = UIBarButtonItem(customView: btn)
        
        self.navigationItem.setRightBarButton(item, animated: true)
    }
}
