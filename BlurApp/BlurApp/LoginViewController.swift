//
//  ViewController.swift
//  BlurApp
//
//  Created by Владислав on 01.02.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var backgroundImageView: UIImageView!
    
    var blur: Bool = false;
    
    @IBAction func setBlur(_ sender: UIButton) {
        
        blur = !blur;
        
        if blur {
            for subview in backgroundImageView.subviews {
                if subview is UIVisualEffectView {
                    subview.removeFromSuperview()
                }
            }
        }
        else {
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.prominent)
            blurEffectView = UIVisualEffectView(effect: blurEffect)
            
            blurEffectView?.frame = view.bounds
            backgroundImageView.addSubview(blurEffectView!)
        }
    }
    
    var blurEffectView: UIVisualEffectView?
    
    let imageSet = ["2a48ea7066200336d7d569b61c802835",
                    "artworks-000542460303-b04zcw-t500x500",
                    "KI6v3CD_r64",
                    "MXilkOgnu88",
                    "yHuZrayp9no"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Randomly pick an image
        let selectedImageIndex = Int(arc4random_uniform(5))
        // Apply blurring effect
        backgroundImageView.image = UIImage(named: imageSet[selectedImageIndex])
        backgroundImageView.contentMode = UIView.ContentMode.scaleAspectFill

        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.prominent)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView?.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView!)
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        blurEffectView?.frame = view.bounds
    }
}

