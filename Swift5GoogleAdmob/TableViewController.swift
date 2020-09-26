//
//  TableViewController.swift
//  Swift5GoogleAdmob
//
//  Created by 岩崎舞 on 2020/09/25.
//  Copyright © 2020 岩崎舞. All rights reserved.
//

import UIKit
import GoogleMobileAds

class TableViewController: UITableViewController,GADBannerViewDelegate,GADInterstitialDelegate {
    
    //配列を準備
    var profileImageArray = ["0","1","2","3","4"]
    var textArray = ["顔文字0","顔文字1","顔文字2","顔文字3","インタースティシャル広告"]
    //インタースティシャル用の
    var interstital:GADInterstitial!
    //背景画像
    var backImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let image = UIImage(named: "backGrondImage")
        //高さ・幅めいっぱいに
        backImageView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        backImageView.image = image
        tableView.backgroundView = backImageView
        
        interstital = createAndLoadInterstital()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        
        //セクションの数
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        //一つのセクションのセルの数
        
        return 1 + textArray.count
        
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //今どのセルがタップされたのかが入る
        let indexNumber = indexPath.row
        
        //indexpath検証用
        print(indexPath.row)
        
        if indexPath.row == 0{
            //インタースティシャル広告のセル
            
            //セルを作成
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerCell", for: indexPath)
            
            let bannerView = cell.viewWithTag(1) as! GADBannerView
            bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
//            ca-app-pub-9914051470961049/6495499319
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
            
            return cell
        }else{//indexpathが0じゃないとき⇨コンテンツがくる
            
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
            let profileImageView = cell2.viewWithTag(1) as! UIImageView
            
            profileImageView.image = UIImage(named: profileImageArray[indexNumber - 1])
            
            let nameLabel = cell2.viewWithTag(2) as! UILabel
            nameLabel.textColor = .white
            nameLabel.font = .boldSystemFont(ofSize: 20)
            nameLabel.numberOfLines = 3
            nameLabel.text = textArray[indexNumber - 1]
            
            return cell2
            
        }
    }

    //セルがタップされたときの挙動
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 5{
            //インタースティシャルの広告を出す
            if interstital.isReady{
                
                interstital.present(fromRootViewController: self)
                
            }else{
                
                print("広告の準備がまだです！")
                
            }
        }
    }
    
    func createAndLoadInterstital() -> GADInterstitial{
        let interstital = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
//        ca-app-pub-9914051470961049/7928850549
        interstital.delegate = self
        interstital.load(GADRequest())
        
        return interstital
        
    }
    
    //インタースティシャルの広告を消した時にもう一度高校の情報を引っ張ってくる
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstital = createAndLoadInterstital()
    }
    
}
