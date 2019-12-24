import UIKit
import SceneKit
import PlaygroundSupport

public class IntroductionController:UIViewController {
    private var startButton:UIButton = UIButton()
    private var nextButton:UIButton = UIButton()
    
    private let scene: SCNScene = SCNScene()
    private let sceneView: SCNView = SCNView()
    

    override public func loadView() {
        
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 768, height: 1024))
        
        
        let scene = self.scene
        let sceneView = self.sceneView
        sceneView.scene = scene
        
        
        //Background Image
        let backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 768, height: 1024))
        backgroundImage.image = UIImage(named: "space_bg.jpg")
        view.addSubview(backgroundImage)
        
        
        // SolSys logo
        let w = view.bounds.size.width   // w = width
        let h = view.bounds.size.height  // h = height
        // PUT AN ROUNDED IMAGE!!
       
        
        let roundedLogo = UIImageView(frame: CGRect(x: w/2, y: h/2, width: 400, height: 400))
        roundedLogo.image = UIImage(named: "solsys_logo.png")
        roundedLogo.center = CGPoint(x: w/2, y: h/2 - 100)
        roundedLogo.layer.cornerRadius = roundedLogo.frame.size.height / 2
        roundedLogo.layer.borderWidth = 5
        roundedLogo.clipsToBounds = true
        view.addSubview(roundedLogo)
        
        
        // Create Title Text
        let titleText = UILabel(frame: CGRect(x: w/2, y: h/2, width: 300, height: 300))
        titleText.center = CGPoint(x: w/2 + 25, y: h/2 - 400)
        
        titleText.text = "SolSys"
        titleText.font = UIFont(name: "HelveticaNeue-Thin", size: 90.0)
        titleText.textColor = .white
        view.addSubview(titleText)
        
        
        // Create Start Button
        startButton = UIButton(frame: CGRect(x: w/2, y: h/2, width: 300, height: 300))
        startButton.center = CGPoint(x: w/2, y: h/2 + 300)
        startButton.setTitle("Start", for: .normal)
        startButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 85.0)
        startButton.setTitleColor(UIColor.white, for: .normal)
        startButton.layer.borderWidth = 0.00001
        startButton.layer.borderColor = UIColor.white.cgColor
        startButton.alpha = 1
        view.addSubview(startButton)
        
        // Add action to the button
        startButton.addTarget(self, action: #selector(self.start), for: .touchUpInside)

        self.view = view
    }
    
    @objc func start() {
        let viewController = Storytelling()
        viewController.preferredContentSize = CGSize(width: 768, height: 1024)
        self.present(viewController, animated: true, completion: nil)
    }
    
}
