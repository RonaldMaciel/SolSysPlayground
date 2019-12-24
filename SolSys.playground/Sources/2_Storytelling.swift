import UIKit
import SceneKit
import PlaygroundSupport

public class Storytelling: UIViewController {
    private let scene:SCNScene = SCNScene()
    private let sceneView:SCNView = SCNView()
    private var storyTellingLabel:UILabel = UILabel()
    private var nextButton: UIButton = UIButton()

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 768, height: 1024))
        
        let scene = self.scene
        let sceneView = self.sceneView
        sceneView.scene = scene
        
        
        // Background Image
        let backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 768, height: 1024))
        backgroundImage.image = UIImage(named: "space_bg.jpg")
        view.addSubview(backgroundImage)
        
        
        
        let w = view.bounds.size.width   // w = width
        let h = view.bounds.size.height  // h = height
        
        // Create the "What is a planet?" question
        let whatsPlanet = UILabel(frame: CGRect(x: w/2, y: h/2, width: 400, height: 400))
        whatsPlanet.center = CGPoint(x: w/2 - 100, y: h/2 - 400)
        whatsPlanet.font = UIFont(name: "HelveticaNeue-Thin", size: 50)
        whatsPlanet.text = "What is a planet?"
        whatsPlanet.textColor = .white
        view.addSubview(whatsPlanet)
        
        // Create the answers
        let answer1 = UILabel(frame: CGRect(x: w/2, y: h/2, width: 400, height: 400))
        answer1.center = CGPoint(x: w/2 - 100, y: h/2 - 100)
        answer1.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
        answer1.textColor = .white
        answer1.text = "A planet is a celestial body that"
        answer1.numberOfLines = 1
        answer1.sizeToFit()
        view.addSubview(answer1)
    
        let answer2 = UILabel(frame: CGRect(x: w/2, y: h/2, width: 400, height: 400))
        answer2.center = CGPoint(x: w/2 - 100, y: h/2 - 50)
        answer2.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
        answer2.textColor = .white
        answer2.text = "(a) is in orbit around the Sun,"
        answer2.sizeToFit()
        view.addSubview(answer2)
        
        let answer3 = UILabel(frame: CGRect(x: w/2, y: h/2, width: 400, height: 400))
        answer3.center = CGPoint(x: w/2 - 100, y: h/2)
        answer3.numberOfLines = 0
        answer3.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
        answer3.textColor = .white
        answer3.text = "(b) has sufficient mass for its self-gravity to overcome rigid\nbody forces so that it assumes a hydrostatic equilibrium (nearly round) shape, and"
        answer3.sizeToFit()
        view.addSubview(answer3)
        
        
        let answer4 = UILabel(frame: CGRect(x: w/2, y: h/2, width: 400, height: 400))
        answer4.center = CGPoint(x: w/2 - 100, y: h/2 + 190)
        answer4.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
        answer4.textColor = .white
        answer4.text = "(c) has cleared the neighbourhood around its orbit."
        answer4.numberOfLines = 1
        answer4.sizeToFit()
        view.addSubview(answer4)
        

        
        // Create the storytelling
        storyTellingLabel = UILabel(frame: CGRect(x: w/2, y: h/2, width: 600, height: 600))
        storyTellingLabel.center = CGPoint(x: w/2 + 50, y: h/2 + 250)
        storyTellingLabel.text = "If you wanna know more about our Solar System, just click on the planets to see the information about them. You can ending up finding some really good curiosities in here."
        storyTellingLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
        storyTellingLabel.textColor = .white
        storyTellingLabel.numberOfLines = 4
        view.addSubview(storyTellingLabel)

        
        // Create the Next button - Target
        self.nextButton = UIButton(frame: CGRect(x: w/2, y: h/2, width: 300, height: 300))
        self.nextButton.center = CGPoint(x: w/2, y: h/2 + 400)
        self.nextButton.setTitle("Next", for: .normal)
        self.nextButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 70)
        self.nextButton.setTitleColor(UIColor.white, for: .normal)
        self.nextButton.layer.borderWidth = 0.00001
        self.nextButton.alpha = 1
        view.addSubview(self.nextButton)

        self.nextButton.addTarget(self, action: #selector(self.passScene), for: UIControl.Event.touchUpInside)
        
        self.view = view
    }
    
    @objc func passScene() {
        let viewController = Structure()
        viewController.preferredContentSize = CGSize(width: 768, height: 1024)
        self.present(viewController, animated: true)
    }
}

