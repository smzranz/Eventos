//
//  MyAlbumViewController.swift
//  Eventos
//
//  Created by Shamshir on 29/01/18.
//  Copyright © 2018 citrusinformatics. All rights reserved.
//

import UIKit


class MyAlbumViewController: UIViewController, UIPageViewControllerDataSource
{
    var pageViewController : UIPageViewController?
    
    var pageImages  = [#imageLiteral(resourceName: "1"),#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "3"),#imageLiteral(resourceName: "4"),#imageLiteral(resourceName: "5")]
    var currentIndex : Int = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        pageViewController = UIPageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
        pageViewController!.dataSource = self
        
        let startingViewController: InstructionView = viewControllerAtIndex(index: 0)!
        let viewControllers = [startingViewController]
        pageViewController!.setViewControllers(viewControllers , direction: .forward, animated: false, completion: nil)
        pageViewController!.view.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height);
        
        addChildViewController(pageViewController!)
        view.addSubview(pageViewController!.view)
        pageViewController!.didMove(toParentViewController: self)
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
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
    {
        var index = (viewController as! InstructionView).pageIndex
        
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        
        return viewControllerAtIndex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        var index = (viewController as! InstructionView).pageIndex
        
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        
        if (index == self.pageImages.count) {
            return nil
        }
        
        return viewControllerAtIndex(index: index)
    }
    
    func viewControllerAtIndex(index: Int) -> InstructionView?
    {
        if self.pageImages.count == 0 || index >= self.pageImages.count
        {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        let pageContentViewController = InstructionView()
        pageContentViewController.imageFile = pageImages[index]
        pageContentViewController.pageIndex = index
        currentIndex = index
        
        return pageContentViewController
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return self.pageImages.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 0
    }
    
}

