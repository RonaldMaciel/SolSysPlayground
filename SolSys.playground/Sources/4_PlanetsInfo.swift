import UIKit
import SceneKit
import PlaygroundSupport

public class PlanetInfo: UIViewController {
    private let scene: SCNScene = SCNScene()
    private let scnView: SCNView = SCNView()
    private var returnButton: UIButton = UIButton()
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = self.scene
        let sceneView = self.scnView
        sceneView.scene = scene
        

        // Constants 
        let w = view.bounds.size.width   // w = width
        let h = view.bounds.size.height  // h = height
        
        
        // Configuring scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        cameraNode.position = SCNVector3(x: -1, y: 0, z: 30)
        cameraNode.position.y += 10.0
        cameraNode.eulerAngles.x -= 0.225
        cameraNode.position.z += 7.0
        cameraNode.position.x += 1.0
        
        
        // Configure background
        sceneView.frame = CGRect(x: 0, y: 0, width: 768, height: 1024)
        sceneView.allowsCameraControl = true
        sceneView.backgroundColor = UIColor.black
        
        
        let stars = SCNParticleSystem(named: "stars.scnp", inDirectory: nil)
        if let particles = stars {
            cameraNode.addParticleSystem(particles)
            
        }
        
        
        // Configuring the light
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode)
        
        
        // Configuring the ambient
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        ambientLightNode.light!.color = UIColor.darkGray
        scene.rootNode.addChildNode(ambientLightNode)
        
        
        // Get the planet that it was selected
        let choosenPlanet = Structure.choosenPlanet
        
        
        // Create the Planet
        let planetGeo = SCNSphere(radius: CGFloat(6)) // based on their sizes, create the spherical form
        let planetNode = SCNNode(geometry: planetGeo)
        
        planetNode.position = SCNVector3(x: 0, y: 10, z: 0) // fixed to the X axis

        // Create Planet Name Label
        let nameOfPlanet = UILabel(frame: CGRect(x: w/2 - 150, y: -85, width: 300, height: 300))
        nameOfPlanet.textAlignment = .center
        nameOfPlanet.font = UIFont(name: "HelveticaNeue-Thin", size: 70.0)
        nameOfPlanet.textColor = .white
        
        
        
        // Create the "Details and Facts" Title
        let detailsFactsTitle = UILabel(frame: CGRect(x: w/2 - 360, y: h/2 - 170, width: 300, height: 300))
        detailsFactsTitle.font = UIFont(name: "HelveticaNeue-Thin", size: 33)
        detailsFactsTitle.textColor = .white
        detailsFactsTitle.text = "Details and Facts:"
        sceneView.addSubview(detailsFactsTitle)
        
        
        
        // Create the details of each Planet
        let detailsOfPlanet = UILabel(frame: CGRect(x: w/2 - (w*0.8/2), y: h/2 + 20, width: 600, height: 500))
        detailsOfPlanet.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
        detailsOfPlanet.textColor = .white
        
        switch choosenPlanet {
        case "mercury":
            planetGeo.firstMaterial?.diffuse.contents = UIImage(named: "\(choosenPlanet).jpg") // add the texture to the planet
            planetNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 1, z: 0, duration: 5))) // add rotation to the planet
            scene.rootNode.addChildNode(planetNode)
            
            // Add the Planet Name to the scene
            nameOfPlanet.text = "Mercury"
            sceneView.addSubview(nameOfPlanet)
            
            // Details
            detailsOfPlanet.text = """
                                    ✦ The closest planet to the Sun
                                    ✦ A year in Mercury is just 88 Earth-days
                                    ✦ Has ice in shadowed craters (those that never receive any sunlight)
                                    ✦ He's the fastest planet: 107.082 miles per hour (47.87 km/s)
                                    ✦ He's the smallest planet in the Solar System
                                    ✦ He has wrinkles
                                    ✦ He's the second hottest planet: 800.6ºF (427ºC)
                                """
            detailsOfPlanet.numberOfLines = 0
            detailsOfPlanet.sizeToFit()
            sceneView.addSubview(detailsOfPlanet)

            
        case "venus":
            planetGeo.firstMaterial?.diffuse.contents = UIImage(named: "\(choosenPlanet).jpg") // add the texture to the planet
            planetNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 1, z: 0, duration: 5))) // add rotation to the planet
            scene.rootNode.addChildNode(planetNode)
            
            
            // Add the Planet Name to the scene
            nameOfPlanet.text = "Venus"
            sceneView.addSubview(nameOfPlanet)

            // Details
            detailsOfPlanet.text = """
                                    ✦ Second fastest planet: 78.337 miles per hour (35.02km/s)
                                    ✦ Venus has an iron core
                                    ✦ Hottest planet: 863°F (462°C) because his atmosphere is a dense 96.5% carbon dioxide which traps heat and caused the greenhouse effect
                                    ✦ Venus is the brightest planet in the Solar System
                                    ✦ Year equivalent to 224.7 Earth-days. (Fun Fact: A day on Venus lasts longer than a year)
                                """
            detailsOfPlanet.numberOfLines = 0
            detailsOfPlanet.sizeToFit()
            sceneView.addSubview(detailsOfPlanet)

        case "earth":
            planetGeo.firstMaterial?.diffuse.contents = UIImage(named: "\(choosenPlanet).jpg") // add the texture to the planet
            planetNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 1, z: 0, duration: 5))) // add rotation to the planet
            scene.rootNode.addChildNode(planetNode)
            
            
            // Add the Planet Name to the scene
            nameOfPlanet.text = "Earth"
            sceneView.addSubview(nameOfPlanet)
            
            // Details
            detailsOfPlanet.text = """
                                    ✦ Travels around: 66.615 miles per hour (29.78km/s)
                                    ✦ Earth’s core is very active, its the only planet with tectonic plates
                                    ✦ Earth’s 4,543 billion years old
                                    ✦ Earth’s rotation is gradually slowing
                                    ✦ The Moon is the Earth’s only natural satellite
                                    ✦ Earth’s atmosphere is composed of 78% nitrogen and 21% oxygen
                                """
            detailsOfPlanet.numberOfLines = 0
            detailsOfPlanet.sizeToFit()
            sceneView.addSubview(detailsOfPlanet)


            
        case "mars":
            planetGeo.firstMaterial?.diffuse.contents = UIImage(named: "\(choosenPlanet).jpg") // add the texture to the planet
            planetNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 1, z: 0, duration: 5))) // add rotation to the planet
            scene.rootNode.addChildNode(planetNode)
            
            
            // Add the Planet Name to the scene
            nameOfPlanet.text = "Mars"
            sceneView.addSubview(nameOfPlanet)
            
            // Details
            detailsOfPlanet.text = """
                                    ✦ Travels around: 53.858 miles per hour (24.07km/s)
                                    ✦ Mars has a carbon dioxide atmosphere.
                                    ✦ The tallest mountain known in the solar system is on Mars. Olympus Mons is a 21 km high and 600 km diameter shield volcano
                                    ✦ Year equivalent to 687 Earth-days (or 1.88 Earth-years)
                                    ✦ His average temperature is -81ºF (-62,78ºC)
                                    ✦ Has the largest dust storms in the Solar System
                                """
            detailsOfPlanet.numberOfLines = 0
            detailsOfPlanet.sizeToFit()
            sceneView.addSubview(detailsOfPlanet)



        case "jupiter":
            planetGeo.firstMaterial?.diffuse.contents = UIImage(named: "\(choosenPlanet).jpg") // add the texture to the planet
            planetNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 1, z: 0, duration: 5))) // add rotation to the planet
            scene.rootNode.addChildNode(planetNode)
            
            
            // Add the Planet Name to the scene
            nameOfPlanet.text = "Jupiter"
            sceneView.addSubview(nameOfPlanet)
            
            // Details
            detailsOfPlanet.text = """
                                    ✦ Has 318 times the mass of Earth (2.5 times the mass of all the other planets combined)
                                    ✦ Travels around: 29.236 miles per hour (13.07km/s)
                                    ✦ It is composed of mostly hydrogen and helium
                                    ✦ Jupiter has 67 known moons or satellites
                                    ✦ Has the shortest day of all planets: 9h55min
                                    ✦ Year equivalent to 11.86 Earth-years. (Fun Fact: A day on the equator of Jupiter is actually only 10 hours long)
                                """
            detailsOfPlanet.numberOfLines = 0
            detailsOfPlanet.sizeToFit()
            sceneView.addSubview(detailsOfPlanet)

            


        case "saturn":
            planetGeo.firstMaterial?.diffuse.contents = UIImage(named: "\(choosenPlanet).jpg") // add the texture to the planet
            planetNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 1, z: 0, duration: 5))) // add rotation to the planet
            scene.rootNode.addChildNode(planetNode)
            
            
            // Add the Planet Name to the scene
            nameOfPlanet.text = "Saturn"
            sceneView.addSubview(nameOfPlanet)
            
            // Details
            detailsOfPlanet.text = """
                                    ✦ Has 62 moons
                                    ✦ Travels around: 21.675 miles per hour (9.69km/s)
                                    ✦ Made mostly of hydrogen and helium gas, he's the least dense planet - that means if put in a big enough bath tub, Saturn would float
                                    ✦ Saturn has a year equivalent to 29.46 Earth-years
                                    ✦ A day in Saturn takes 10h14min
                                    ✦ Has the average temperature of -288,4ºF (-178ºC)
                                """
            detailsOfPlanet.numberOfLines = 0
            detailsOfPlanet.sizeToFit()
            sceneView.addSubview(detailsOfPlanet)



        case "uranus":
            planetGeo.firstMaterial?.diffuse.contents = UIImage(named: "\(choosenPlanet).jpg") // add the texture to the planet
            planetNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 1, z: 0, duration: 5))) // add rotation to the planet
            scene.rootNode.addChildNode(planetNode)
            
            
            // Add the Planet Name to the scene
            nameOfPlanet.text = "Uranus"
            sceneView.addSubview(nameOfPlanet)
            
            // Details
            detailsOfPlanet.text = """
                                    ✦ Has the second slowest orbital speed: 15.233 miles per hour (6.81km/s)
                                    ✦ Uranus has 27 known moons
                                    ✦ Similar to Jupiter and Saturn, his atmosphere has hydrogen and helium, it also contains copious amounts of ice water, ammonia, and methane
                                    ✦ It has the coldest atmosphere in the Solar System at -435°F (-224°C)
                                    ✦ Uranus has a year equivalent to 84.01 Earth-years
                                """
            detailsOfPlanet.numberOfLines = 0
            detailsOfPlanet.sizeToFit()
            sceneView.addSubview(detailsOfPlanet)



        case "neptune":
            planetGeo.firstMaterial?.diffuse.contents = UIImage(named: "\(choosenPlanet).jpg") // add the texture to the planet
            planetNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 1, z: 0, duration: 5))) // add rotation to the planet
            scene.rootNode.addChildNode(planetNode)
            
            
            // Add the Planet Name to the scene
            nameOfPlanet.text = "Neptune"
            sceneView.addSubview(nameOfPlanet)
            
            // Details
            detailsOfPlanet.text = """
                                    ✦ Neptune has the slowest orbital speed: 12.146 miles per hour (5.43km/s)
                                    ✦ Neptune has 14 moons
                                    ✦ His atmosphere is made of hydrogen and helium, with some methane
                                    ✦ The last planet of our Solar System
                                    ✦ Only one spacecraft has flown by Neptune
                                    ✦ Year equivalent to 164.79 Earth-years
                                """
            detailsOfPlanet.numberOfLines = 0
            detailsOfPlanet.sizeToFit()
            sceneView.addSubview(detailsOfPlanet)


        default:
            print("That's not a planet")

        }
        
    
        
        // Create the Return Button
        returnButton = UIButton(frame: CGRect(x: w/2, y: h/2, width: 300, height: 300))
        returnButton.center = CGPoint(x: w/2, y: h/2 + 470)
        returnButton.setTitle("Return", for: .normal)
        returnButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Thin", size: 45.0)
        returnButton.setTitleColor(UIColor.white, for: .normal)
        returnButton.layer.borderWidth = 0.00001
        returnButton.layer.borderColor = UIColor.white.cgColor
        returnButton.alpha = 1
        sceneView.addSubview(returnButton)

        
        returnButton.addTarget(self, action: #selector(self.back), for: UIControl.Event.touchUpInside)
        
        
        self.view = scnView
    }
    
    @objc private func back() {
        self.dismiss(animated: true, completion: nil)
    }
}

