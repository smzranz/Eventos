//
//  DemosViewController.swift
//  Eventos
//
//  Created by Shamshir on 19/09/17.
//  Copyright © 2017 citrusinformatics. All rights reserved.
//

import UIKit
import FontAwesome_swift

class DemosViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    
    var selectedImageIndex : IndexPath!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        imageCollectionView.reloadData()
//        imageCollectionView.showLoader()
//        imageCollectionView.layoutIfNeeded()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! DemoImageCollectionViewCell
        cell.demoImageView.image = UIImage(named: "\(indexPath.row+1)")
        if indexPath.section == 1{
            cell.videoCamera.image = UIImage.fontAwesomeIcon(name:.videoCamera , textColor: UIColor.white, size: cell.videoCamera.frame.size)
            //UIImage.fontAwesomeIcon(code: .vimeoSquare, textColor: UIColor.white, size: cell.videoCamera.frame.size)
        cell.videoCamera.isHidden = false
        }else{
        cell.videoCamera.isHidden = true
        
        }
        return cell
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //   if indexPath.section == 1{
        if indexPath.section == 0{
            
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeaderCollectionReusableView
            
            header.label.text = "Photos"
           // header.label.layer.cornerRadius = 3
            header.label.textColor = UIColor.black
         //   header.label.layer.borderWidth = 1
            header.label.layer.masksToBounds = true
            return header
        }
        else if indexPath.section == 1{
            
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeaderCollectionReusableView
            
            header.label.text = "Videos"
         //   header.label.layer.cornerRadius = 3
            header.label.textColor = UIColor.black
        //    header.label.layer.borderWidth = 1
            header.label.layer.masksToBounds = true
            return header
            
        }
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeaderCollectionReusableView
        
        header.label.text = "xx"
        
        return header
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
       
        return CGSize(width: 300, height: 40)
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedImageIndex = indexPath
        
        performSegue(withIdentifier: "toDetailImage", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailImage" {
            let destView = segue.destination as! DetailImageViewViewController
          //  destView.photoArray = photoReference
            destView.selectedImageIndex = selectedImageIndex
            
        }
    }
    
    
    @IBAction func backBtnAction(_ sender: Any) {
        
        backBtnTapped()
    }

}
