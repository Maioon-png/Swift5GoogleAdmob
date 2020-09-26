//
//  ViewController.swift
//  Swift5GoogleAdmob
//
//  Created by 岩崎舞 on 2020/09/22.
//  Copyright © 2020 岩崎舞. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {

    @IBOutlet weak var BannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BannerView.adUnitID = "ca-app-pub-3940256099942544~1458002511"
        BannerView.rootViewController = self
        BannerView.load(GADRequest())
        
        // Do any additional setup after loading the view.
    }


}

