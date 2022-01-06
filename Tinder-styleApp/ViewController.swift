//
//  ViewController.swift
//  Tinder-styleApp
//
//  Created by RyoYano on 2022/01/06.
//

import UIKit
import Lottie


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        showAnimation()
        
    }
//    アニメーション作成
    func showAnimation(){
        
        let animationView = AnimationView(name: "84008-hearts")
        
        animationView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        animationView.center = self.view.center
        animationView.loopMode = .playOnce
        animationView.contentMode = .scaleAspectFill
        animationView.animationSpeed = 1
        
        view.addSubview(animationView)
//        アニメーション終了後に遷移
        animationView.play { finished in
            if finished {
                animationView.removeFromSuperview()
                self.performSegue(withIdentifier: "home", sender: nil)
            }
        }
        
        
        
    }


    
    
}

