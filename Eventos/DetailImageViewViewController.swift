//
//  DetailImageViewViewController.swift
//  KochiMetro
//
//  Created by Shamshir Anees on 26/04/17.
//  Copyright © 2017 Citrus. All rights reserved.
//

import UIKit

class DetailImageViewViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UIScrollViewDelegate {
    
    @IBOutlet var bottomCollectionView: UICollectionView!
    
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    // var colorObject = ColorFile()
      var onceFlag = Bool()
 //   var photoArray = [String]()
    var selectedImageIndex :IndexPath!
      //let apiServerKey = "AIzaSyCHz7NTh5-69lUZGfvEDFZhgV2KVQUHlNM"
    override func viewDidLoad() {
        super.viewDidLoad()
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        print(selectedImageIndex)
        
// self.imageCollectionView.scrollToItem(at: selectedImageIndex, at: .centeredHorizontally, animated: false)
        // Do any additional setup after loading the view.
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
        
        cell.demoImageView.image = UIImage(named: "\(indexPath.row+1)")
        cell.layer.masksToBounds = true
        selectedImageIndex = indexPath
        return cell
        }else{
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! DemoImageCollectionViewCell
            
            cell.demoImageView.image = UIImage(named: "\(indexPath.row+1)")
            cell.layer.masksToBounds = true
            if indexPath == selectedImageIndex{
                
                cell.bluxView.isHidden = true
            }else{
                
                cell.bluxView.isHidden = true
                
            }

            return cell
            
        }
           
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        if collectionView == bottomCollectionView {
        return CGSize(width: 50, height: 50)
        }
        return CGSize(width: self.view.frame.width, height: self.view.frame.height-90)
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
}
