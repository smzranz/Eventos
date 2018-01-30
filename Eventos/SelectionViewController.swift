//
//  SelectionViewController.swift
//  Eventos
//
//  Created by Shamshir Anees on 29/09/17.
//  Copyright © 2017 citrusinformatics. All rights reserved.
//

import UIKit
import FontAwesome_swift

class SelectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var uploadBtn: UIButton!
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet var navBar: UIView!
    
    @IBOutlet var imageCollectionView: UICollectionView!
    var selectedImageIndex : IndexPath!
    var count = 0
var imageSelected = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
      uploadBtn.setImage(UIImage.fontAwesomeIcon(name: .cloudUpload, textColor: UIColor.white, size: uploadBtn.frame.size), for: .normal)
        uploadBtn.tintColor = UIColor.white
        self.countLabel.text = "\(count)"
        self.navigationController?.navigationBar.isHidden = true
imageSelected = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
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
        
        return 14
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! SelectionImageCollectionViewCell
        
        cell.imageView.image = UIImage(named: "\(indexPath.row+1)")
        
        cell.selctionBtn.addTarget(self, action: #selector(imageSelect(sender:)), for: .touchUpInside)
        cell.selctionBtn.tag = indexPath.row
        
        if imageSelected[indexPath.row] == 1 {
        
            cell.selctionBtn.setImage(UIImage.fontAwesomeIcon(name: .checkSquare, textColor: .green, size: cell.selctionBtn.frame.size,backgroundColor:UIColor.white), for: .normal)
        
        }else{
        
        cell.selctionBtn.setImage(UIImage.fontAwesomeIcon(name: .squareO, textColor: .green, size: cell.selctionBtn.frame.size), for: .normal)
        
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
      //  if collectionView == sel{
            
            selectedImageIndex = indexPath
            
            performSegue(withIdentifier: "toDetailImage", sender: self)
       // }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
        
        return CGSize(width: collectionView.frame.size.width, height: 478)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       
        return 2
    }
    
    
    //MARK:- image select
    func imageSelect(sender:UIButton){
    
    let index = sender.tag
        if imageSelected[index] == 0{
        imageSelected[index] = 1
            count += 1
        }else{
        imageSelected[index] = 0
            count -= 1
        }
        self.countLabel.text = "\(count)"
        let sam : IndexPath = [0,index]
        self.imageCollectionView.reloadItems(at: [sam])
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailImage" {
            let destView = segue.destination as! DetailImageViewViewController
            destView.fromSelection = true
            //  destView.photoArray = photoReference
            destView.selectedImageIndex = selectedImageIndex
            
        }
    }
    
    
    
    @IBAction func backBtnActn(_ sender: Any) {
        
        
        navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func uploadBtnPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "Attention!", message: "Do you realy want submit the selected Images", preferredStyle: UIAlertControllerStyle.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.destructive, handler: { action in
            
            self.navigationController?.popViewController(animated: true)
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
    
}
