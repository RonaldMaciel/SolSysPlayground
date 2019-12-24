import SceneKit
import SpriteKit
import PlaygroundSupport
import AVFoundation

public class Structure: UIViewController { 
    static var choosenPlanet: String = ""
    
    private let scene: SCNScene = SCNScene()
    private let sceneView: SCNView = SCNView()
    
    private var planets: [String] = ["mercury", "venus", "earth", "mars", "jupiter", "saturn", "uranus", "neptune"]

    var earthNode = SCNNode()
    var jupiterNode = SCNNode()
    var saturnNode = SCNNode()
    var neptuneNode = SCNNode()
    var uranusNode = SCNNode()
    var marsNode = SCNNode()
    var mercuryNode = SCNNode()
    var venusNode = SCNNode()
    var moonNode = SCNNode()

    override public func viewDidLoad() {
        super.viewDidLoad()
        
        
        let scene = self.scene
        let sceneView = self.sceneView
        sceneView.scene = scene
        
        
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
        
        
        // Background with Stars
        let stars = SCNParticleSystem(named: "stars.scnp", inDirectory: nil)
        if let starsParticles = stars {
            cameraNode.addParticleSystem(starsParticles)
        }

      
        // Create the planets and theirs constants
        var rings = [3, 3.7, 5.0, 6.5, 8.5, 10.5, 12.5, 14.5]         // planet orbit distance
        var sizes = [0.3, 0.55, 0.55, 0.4, 1.1, 0.90, 0.82, 0.80]     // planet physical size
        var orbits = [0.62, 0.52, 0.46, 0.42, 0.30, 0.35, 0.26, 0.25] // planet orbit velocity
        var rotations = [1.6, 0.9, 1.2, 0.8, 1.3, 0.2, 0.4, 0.8]      // planet spinning
        
        
        for index in 0..<planets.count { // For each planet
            // Create the variables that will help create each specific planet
            let planet = planets[index]              // an individual planet
            let ring = CGFloat(rings[index])         // their orbit distance
            let size = sizes[index]                  // their physical size
            let orbit = CGFloat(orbits[index])       // the velocity
            let rotation = CGFloat(rotations[index]) // individual planet spinning
            
            
            // the planet orbit geometry
            let ringGeo = SCNTorus(ringRadius: ring, pipeRadius: 0.03)  // the ring geometry
            let ringNode = SCNNode(geometry: ringGeo)
            scene.rootNode.addChildNode(ringNode)                       // add the ring to the scene
            ringGeo.firstMaterial?.diffuse.contents = UIColor.yellow    // ring color = yellow
            
            
            // Add the spherical form to each planet
            let planetGeo = SCNSphere(radius: CGFloat(size)) // based on their sizes, create the spherical form
            let planetNode = SCNNode(geometry: planetGeo)
            ringNode.addChildNode(planetNode)               // add the created planet to their orbital ring
            planetNode.position = SCNVector3(x: Float(ring), y: 0, z: 0) // fixed to the X axis
            
            planetGeo.firstMaterial?.diffuse.contents = UIImage(named: "\(planet).jpg") // add the texture to the planet
            ringGeo.firstMaterial?.diffuse.contents = UIImage(named: "\(planet).jpg")   // add the same texture of the planet to
                                                                                        // the ring, so they can have the same color
            
        
            // Set Name of planet
            planetNode.name = planet
            
            // Running rotation animation
            ringNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: orbit, z: 0, duration: 1))) // add rotation *to the ring*
            planetNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: rotation, z: 0, duration: 1))) // add rotation *to the planet*
            // that way, create the visual sensation that they move in diferents speeds
            
            
            if index == 2 { // It's the Earth
                // create the orbital ring of the moon
                let moonOrbitNode = SCNNode(geometry: SCNTorus(ringRadius: 0.7, pipeRadius: 0.01))
                // add the orbital ring of the Moon to the Earth
                planetNode.addChildNode(moonOrbitNode)
                
                moonOrbitNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 1.2, z: 0, duration: 1))) // animated
                
                // create the spherical form of the Moon
                let moonGeo = SCNSphere(radius: CGFloat(0.1))
                moonGeo.firstMaterial?.diffuse.contents = UIImage(named: "moon.jpg") // add the texture to the Moon
                
                
                
                moonNode = SCNNode(geometry: moonGeo)
                moonOrbitNode.addChildNode(moonNode)
                moonNode.position = SCNVector3(x: 0.7, y: 0, z: 0)
                
            }
            
            
            if index == 0 { mercuryNode = planetNode }
            if index == 1 {   venusNode = planetNode }
            if index == 2 {   earthNode = planetNode }
            if index == 3 {    marsNode = planetNode }
            if index == 4 { jupiterNode = planetNode }
            if index == 5 {  saturnNode = planetNode }
            if index == 6 {  uranusNode = planetNode }
            if index == 7 { neptuneNode = planetNode }
        }
        
        
        // Create the Sun
        let sunGeo = SCNSphere(radius: CGFloat(2.5))
        let sunNode = SCNNode(geometry: sunGeo)
        
        scene.rootNode.addChildNode(sunNode)
        sunNode.position = SCNVector3(x: 0, y: 0, z: 0)
        sunGeo.firstMaterial?.diffuse.contents = UIImage(named: "sun.jpg")
        
        sunNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 0.1, z: 0, duration: 1)))

        
        
        self.view = sceneView
    }
  
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touchLocation = touches.first?.location(in: sceneView),
            let hitNode = sceneView.hitTest(touchLocation, options: nil).first?.node
            else {
                return
            }
        
        Structure.choosenPlanet = hitNode.name ?? ""
        
        if Structure.choosenPlanet != "" {
            let viewController = PlanetInfo()
            viewController.preferredContentSize = CGSize(width: 768, height: 1024)
            self.present(viewController, animated: true)
        }
    }

}
