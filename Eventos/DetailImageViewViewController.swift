//
//  DetailImageViewViewController.swift
//  KochiMetro
//
//  Created by Shamshir Anees on 26/04/17.
//  Copyright © 2017 Citrus. All rights reserved.
//

import UIKit
import FontAwesome_swift

class DetailImageViewViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UIScrollViewDelegate {
    var imageSelected = [Int]()
    var fromSelection : Bool = false
    
    @IBOutlet weak var closeBtnOutlet: UIButton!
    
    
    @IBOutlet var bottomCollectionView: UICollectionView!
    
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    // var colorObject = ColorFile()
      var onceFlag = Bool()
 //   var photoArray = [String]()
    var selectedImageIndex :IndexPath!
      //let apiServerKey = "AIzaSyCHz7NTh5-69lUZGfvEDFZhgV2KVQUHlNM"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        imageSelected = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]

    
        
        
        

        navigationController?.navigationBar.isHidden = true
         closeBtnOutlet.setImage(UIImage.fontAwesomeIcon(name:.times, textColor: UIColor.white, size: CGSize(width: 20, height: 20)), for: .normal)
        closeBtnOutlet.tintColor = UIColor.white
        
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        print(selectedImageIndex)
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
// self.imageCollectionView.scrollToItem(at: selectedImageIndex, at: .centeredHorizontally, animated: false)
        // Do any additional setup after loading the view.
    }
    
    func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == UISwipeGestureRecognizerDirection.right {
            print("Swipe Right")
        }
        else if gesture.direction == UISwipeGestureRecognizerDirection.left {
            print("Swipe Left")
        }
        else if gesture.direction == UISwipeGestureRecognizerDirection.up {
            print("Swipe Up")
        }
        else if gesture.direction == UISwipeGestureRecognizerDirection.down {
            closeBtnAction(closeBtnOutlet)
        }
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        UIApplication.shared.statusBarStyle = .lightContent
//    }
    override func viewWillDisappear(_ animated: Bool) {
      //  super.viewWillDisappear(true)
        navigationController?.navigationBar.isHidden = false
//        UIView.animate(withDuration: 2.0, animations: { () -> Void in
//            UIView.setAnimationCurve(UIViewAnimationCurve.easeOut)
//            UIView.setAnimationTransition(UIViewAnimationTransition.curlDown, for: self.navigationController!.view, cache: false)
//        })
        
        super.viewWillDisappear(animated)
        
    }
    override func viewDidLayoutSubviews() {
        
        //First scroll to current indexPth
        if !onceFlag {
           // indexPath = NSIndexPath(forRow: index, inSection: 0)
            self.imageCollectionView.scrollToItem(at: selectedImageIndex, at: .centeredHorizontally, animated: false)
            self.bottomCollectionView.scrollToItem(at: selectedImageIndex, at: .centeredHorizontally, animated: false)
            onceFlag = true
        }
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == imageCollectionView {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! DemoImageCollectionViewCell
            if fromSelection{
                cell.selectionBtn.addTarget(self, action: #selector(imageSelect(sender:)), for: .touchUpInside)
                cell.selectionBtn.tag = indexPath.row
                
            cell.selectionBtn.isHidden = false
                if imageSelected[indexPath.row] == 1 {
                    
                    cell.selectionBtn.setImage(UIImage.fontAwesomeIcon(name: .checkSquare, textColor: .green, size: cell.selectionBtn.frame.size,backgroundColor:UIColor.white), for: .normal)
                    
                }else{
                    
                    cell.selectionBtn.setImage(UIImage.fontAwesomeIcon(name: .squareO, textColor: .green, size: cell.selectionBtn.frame.size), for: .normal)
                }
            
            }else{
            
                cell.selectionBtn.isHidden = true

            }
        cell.demoImageView.image = UIImage(named: "\(indexPath.row+1)")
        cell.layer.masksToBounds = true
        selectedImageIndex = indexPath
        return cell
        }else{
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ListImageCollectionViewCell
            
            cell.demoImageView.image = UIImage(named: "\(indexPath.row+1)")
             cell.demoImageView.heroID = "ironMan"
        //  cell.demoImageView.heroModifiers =  [.position(CGPoint(x:view.bounds.width/2, y:view.bounds.height+view.bounds.width/2)), .scale(0.6), .fade]
          //  cell.topInset = topLayoutGuide.length
            cell.demoImageView.isOpaque = true
            cell.layer.masksToBounds = true
//            if indexPath == selectedImageIndex{
//                
//                cell.bluxView.isHidden = true
//            }else{
//                
//                cell.bluxView.isHidden = true
//                
//            }

            return cell
            
        }
           
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if collectionView == bottomCollectionView {
        return CGSize(width: 50, height: 50)
        }
        return CGSize(width: self.view.frame.width, height: self.view.frame.height-110)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == bottomCollectionView {
        self.imageCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == imageCollectionView{
        
        
        
        }
    }
    
    
    @IBAction func closeBtnAction(_ sender: Any) {
        
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFuncti)
//        
//        transition.type = kCATransitionFade
//        self.navigationController?.view.layer.add(transition, forKey: nil)
//        _ = self.navigationController?.popToRootViewController(animated: false)
        
      //  navigationController?.navigationBar.isHidden = false
        
        navigationController?.popViewController(animated: true)
        
      
    }
    
    func imageSelect(sender:UIButton){
        
        let index = sender.tag
        if imageSelected[index] == 0{
            imageSelected[index] = 1
        }else{
            imageSelected[index] = 0
        }
        let sam : IndexPath = [0,index]
        self.imageCollectionView.reloadItems(at: [sam])
        
        
    }
}
