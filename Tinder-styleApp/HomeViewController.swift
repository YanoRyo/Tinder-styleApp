//
//  NextViewController.swift
//  Tinder-styleApp
//
//  Created by RyoYano on 2022/01/06.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var BasicView: UIView!
    @IBOutlet weak var likeImageView: UIImageView!
    
    var centerOfCard:CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        centerOfCard = BasicView.center
        
    }
    
//    スワイプでカード左右に動かす機能
    @IBAction func setCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
//        card.center = sender.location(in: self.view)
        let point = sender.translation(in: self.view)
        card.center = CGPoint(x: card.center.x + point.x, y: card.center.y + point.y)
//        角度を変える
        let xFromCenter = card.center.x - view.center.x
        card.transform = CGAffineTransform(rotationAngle: xFromCenter / (view.frame.width / 2 ) * -0.785)
        
        if xFromCenter > 0 {
            likeImageView.image = UIImage(named: "good")
            likeImageView.alpha = 1
            likeImageView.tintColor = UIColor.green
        }else if xFromCenter < 0 {
            
            likeImageView.image = UIImage(named: "bad")
            likeImageView.alpha = 1
            likeImageView.tintColor = UIColor.red
        }
        
        
//
        
        if sender.state == UIGestureRecognizer.State.ended {
//            左にスワイプ
            if card.center.x < 75 {
                UIView.animate(withDuration: 1.0,animations: {
                    card.center = CGPoint(x: card.center.x - 250, y: card.center.y)
                })
                return
//                右にスワイプ
            }else if card.center.x > self.view.frame.width - 75{
                UIView.animate(withDuration: 1.0,animations: {
                    card.center = CGPoint(x: card.center.x + 250, y: card.center.y)
            })
                return
            }
//            もとに戻る処理
            UIView.animate(withDuration: 1.2) { [self] in
                card.center = centerOfCard
                card.transform = .identity
                
            }
            likeImageView.alpha = 0
            
        }
    }
    
    
    
   
}
