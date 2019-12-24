import UIKit
import PlaygroundSupport
/*:
 # SolSys
 ![Playground Icon](solsys_logo.png width="200" height="200")
 
 
 Hi, this is **SolSys** - an interactive playground where you can take a quick look over the Solar System and in the Planets. In here you will be placed in the space and, to interact with the planets, just select the Planet to overview them.
 The frameworks I've used include:
 * **SceneKit:** Creation of 3D nodes, objects (spheres, rings)
 * **UIKit:** Creation of the labels, buttons and backgrounds
 * **AVFoundation:** Background music
 
 
 
 
 Don't forget that you can use the zoom-in and the zoom-out using the option key + touchpad.
 
 
 Hope you like it!
 */


MusicPlayer.play()

let viewController = IntroductionController()
viewController.preferredContentSize = CGSize(width: 768, height: 1024)
PlaygroundPage.current.liveView = viewController
    
