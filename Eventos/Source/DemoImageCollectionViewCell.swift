//
//  DemoImageCollectionViewCell.swift
//  Eventos
//
//  Created by Shamshir Anees on 19/09/17.
//  Copyright © 2017 citrusinformatics. All rights reserved.
//

import UIKit

class DemoImageCollectionViewCell: UICollectionViewCell, UIScrollViewDelegate {
    
    
    @IBOutlet weak var videoCamera: UIImageView!
    
    
    @IBOutlet var selectionBtn: UIButton!
    
    @IBOutlet var demoImageView: UIImageView!
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet var bluxView: UIVisualEffectView!
    
    override func awakeFromNib() {
        
        
        self.scrollView.minimumZoomScale = 1
        self.scrollView.maximumZoomScale = 3.5
        self.scrollView.delegate = self
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.demoImageView
    }
    }
