//
//  TodayViewController.swift
//  Widget
//
//  Created by Guillaume on 17/08/2017.
//  Copyright © 2017 mobizel. All rights reserved.
//

import UIKit
import NotificationCenter
import AVFoundation

class TodayViewController: UIViewController, NCWidgetProviding {
    
    // MARK: - Privates
    fileprivate var player: AVAudioPlayer?
    
    // MARK: - IBOutlet
    @IBOutlet fileprivate weak var ahButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        self.ahButton.setTitle("ah", for: .normal)
        self.ahButton.backgroundColor = .red
        self.ahButton.addTarget(self, action: #selector(playSound), for: .touchDown)
//        self.ahImage.image = UIImage(named: "icon480.png")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }    
}

extension TodayViewController {
    
    @objc
    func playSound() {
        guard let url = Bundle.main.url(forResource: "ah", withExtension: "mp3") else {
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
}
