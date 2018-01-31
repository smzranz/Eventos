//
//  ViewAllViewController.swift
//  Eventos
//
//  Created by Shamshir on 31/01/18.
//  Copyright © 2018 citrusinformatics. All rights reserved.
//

import UIKit

class ViewAllViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
var selectedImageIndex : IndexPath!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in collectionView: UICollectionView) -> Int {
       
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
            return 9
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
            
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
            
            selectedImageIndex = indexPath
            
            performSegue(withIdentifier: "toDetailImage", sender: self)
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     
            
            return CGSize(width: (collectionView.frame.size.width-3)/3, height: (collectionView.frame.size.width-3)/3)
            
      
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       
            
            return 1
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailImage" {
            let destView = segue.destination as! DetailImageViewViewController
            //  destView.photoArray = photoReference
            destView.selectedImageIndex = selectedImageIndex
            
        }
    }
    
    
    @IBAction func backPressed(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    
    
}
