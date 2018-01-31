//
//  PlayVideoViewController.swift
//  Eventos
//
//  Created by Shamshir on 31/01/18.
//  Copyright © 2018 citrusinformatics. All rights reserved.
//

import UIKit

class PlayVideoViewController: UIViewController {

    @IBOutlet weak var videoWebView: UIWebView!
    
    var videoId = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoWebView.scrollView.bounces = false
playVideo(withId: "_WOwOVNEfzY")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func playVideo(withId videoId: String) {
        
        self.view.bringSubview(toFront: videoWebView)
        
        // Set properties
        videoWebView.allowsInlineMediaPlayback = true
        videoWebView.mediaPlaybackRequiresUserAction = false
     
        
       
        let embededHTML = "<html><body style='margin:0px;padding:0px;'><script type='text/javascript' src='http://www.youtube.com/iframe_api'></script><script type='text/javascript'>function onYouTubeIframeAPIReady(){ytplayer=new YT.Player('playerId',{events:{onReady:onPlayerReady}})}function onPlayerReady(a){a.target.playVideo();}</script><iframe id='playerId' type='text/html' width='\(self.view.frame.size.width)' height='\(self.view.frame.size.height-64)' src='http://www.youtube.com/embed/\(videoId)?enablejsapi=1&rel=0&playsinline=1&autoplay=1' frameborder='0'></body></html>"
        
        // Load your webView with the HTML we just set up
        videoWebView.loadHTMLString(embededHTML, baseURL: Bundle.main.bundleURL)
    }

    @IBAction func backBtnPressed(_ sender: Any) {
       dismiss(animated: true, completion: nil)
        
    }
}
