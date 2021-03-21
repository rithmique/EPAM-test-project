//
//  soundList.swift
//  Quizzler-iOS13
//
//  Created by Максим on 19.03.2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation
import AVFoundation


struct AudioPlayer {
    var player: AVAudioPlayer?
    
    
    mutating func playSound(answerSound: String){
        guard let url = Bundle.main.url(forResource: answerSound, withExtension: "mp3") else { return }
        
        do {
            player = try? AVAudioPlayer(contentsOf: url)
            player?.play()
        }
    }
}
