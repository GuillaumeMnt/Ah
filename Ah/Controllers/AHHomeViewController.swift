//
//  AHHomeViewController.swift
//  Ah
//
//  Created by Guillaume on 17/08/2017.
//  Copyright © 2017 mobizel. All rights reserved.
//

import UIKit
import AVFoundation

class AHHomeViewController: UIViewController {

    // MARK: - Global

    // MARK: - Privates
    fileprivate var player: AVAudioPlayer?
    
    // MARK: - IBOutlet
    @IBOutlet fileprivate weak var imageScreen: UIImageView!
    @IBOutlet fileprivate weak var buttonAH: UIButton!

    // MARK: - Application Lifecyle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

}

// MARK: - AHHomeViewController
extension AHHomeViewController {

    // MARK: - Configurations
    fileprivate func setup() {
        self.automaticallyAdjustsScrollViewInsets = false
        self.imageScreen.image = UIImage(asset: .splashscreen)
        prepareButton()
    }
    
    // MARK: - Privates Functions

}

// MARK: - Play sound
extension AHHomeViewController {
    
    @objc func playSound(sender: UIButton) {
        guard let url = Bundle.main.url(forResource: sender.title(for: .normal), withExtension: "mp3") else {
            return
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    fileprivate func prepareButton() {
        self.buttonAH.backgroundColor = .white
        self.buttonAH.setTitle(Constants.Sounds.Ahh, for: .normal)
        self.buttonAH.setTitleColor(.clear, for: .normal)
        self.buttonAH.alpha = Constants.ButtonColor.alpha
        self.buttonAH.layer.cornerRadius = 0.5 * buttonAH.frame.width
        self.buttonAH.addTarget(self, action: #selector(playSound(sender:)), for: .touchDown)
    }
}
