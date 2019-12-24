import Foundation
import AVFoundation
import UIKit

public class MusicPlayer{
    public static var audioPlayer: AVAudioPlayer?
    
    
    public static func play() {
        
        let sound = Bundle.main.path(forResource: "TheyreHere", ofType: "mp3")
        
        do {
            let audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            audioPlayer.prepareToPlay()
            audioPlayer.numberOfLoops = -1
            audioPlayer.play()
            MusicPlayer.audioPlayer = audioPlayer
        }
        catch {
            print("music error")
        }
    }
}

