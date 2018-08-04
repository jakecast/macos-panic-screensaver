import SceneKit

class PNCSceneView: SCNView {
    lazy var logoOptions: PNCLogoGeometry = PNCLogoGeometry(area: 20.0)

    func prepare() {
        self.backgroundColor = .black
        self.scene = SCNScene()
        self.prepareScene()
        self.addLogo()
    }

    func prepareScene() {
        guard let scene = self.scene else {
            return
        }

        let cameraNode = SCNNode()
        cameraNode.name = "cameraNode"
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0.0, y: 0.0, z: 25.0)


        let lightNode = SCNNode()
        lightNode.name = "lightNode"
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0.0, y: 500.0, z: 1000.0)


        let ambientNode = SCNNode()
        ambientNode.name = "ambientNode"
        ambientNode.light = SCNLight()
        ambientNode.light?.type = .ambient
        ambientNode.light?.color = NSColor.darkGray

        scene.rootNode.addChildNode(cameraNode)
        scene.rootNode.addChildNode(lightNode)
        scene.rootNode.addChildNode(ambientNode)

//        self.allowsCameraControl = true
        self.showsStatistics = true
    }

    func addLogo() {
        guard let scene = self.scene else {
            fatalError("missing scene")
        }

        guard let logo = PNCLogoNode(opts: self.logoOptions) else {
            fatalError("invalid logo options")
        }

        scene.rootNode.addChildNode(logo.flatNode)



//        let logo = Logo(size: 20.0, inset: 10.0)
//
//        let upperPath = logo.drawUpperBackground()
//        upperPath.lineJoinStyle = .round
//        upperPath.flatness = 0.01
//
//        let upperShape = SCNShape(path: upperPath, extrusionDepth: 2.0)
//        upperShape.color = .panicSeafoam
//
//        let lowerPath = logo.drawLowerBackground()
//        lowerPath.lineJoinStyle = .round
//        lowerPath.flatness = 0.01
//
//        let lowerShape = SCNShape(path: lowerPath, extrusionDepth: 2.0)
//        lowerShape.color = .panicBlue
//
//        let centerPath = logo.drawLetter()
//        centerPath.lineJoinStyle = .round
//        centerPath.flatness = 0.01
//
//        let centerShape = SCNShape(path: centerPath, extrusionDepth: 3)
//        centerShape.firstMaterial?.diffuse.contents = NSColor.white
//
//        let logoNode = SCNNode()
//        logoNode.addChildNode(SCNNode(geometry: upperShape))
//        logoNode.addChildNode(SCNNode(geometry: lowerShape))
//        logoNode.addChildNode(SCNNode(geometry: centerShape))
//
//        let presNode = logoNode.flattenedClone()
//        presNode.name = "logoNode"
//        presNode.position = SCNVector3(0.0, 0.0, 0.0)
//        presNode.rotation = SCNVector4(1.0, 1.0, 0.0, 0.0)
//
//        scene.rootNode.addChildNode(presNode)

//        self.logoShouldRotate()
//        self.logoShouldMove()
    }

//    func logoShouldMove() {
//        let move = CABasicAnimation(keyPath: "transform.translation")
//        move.toValue = NSPoint(x: .random(in: -5.0 ... 5.0), y: .random(in: -5.0 ... 5.0))
//        move.autoreverses = true
//        move.duration = 5
//
//        let moveAnimation = SCNAnimation(caAnimation: move)
//        moveAnimation.animationDidStop = { [weak self] in self?.logoDidMove($0, $1, $2) }
//
//        self.logoNode?.addAnimation(moveAnimation, forKey: "move")
//    }
//
//    func logoDidMove(_: SCNAnimation, _: SCNAnimatable, _: Bool) -> Void {
//        self.logoShouldMove()
//    }
//
//    func logoShouldRotate(direction: CGFloat = 1.0) {
//        let rotate = CABasicAnimation(keyPath: "rotation.w")
//        rotate.toValue = .random(in: 0.25 ... 0.35) * .pi * direction
//        rotate.duration = 5.0
//        rotate.autoreverses = true
//
//        let rotateAnimation = SCNAnimation(caAnimation: rotate)
//        rotateAnimation.animationDidStop = { [weak self] in self?.logoDidRotate(direction * -1.0, $0, $1, $2) }
//
//        self.logoNode?.addAnimation(rotateAnimation, forKey: "rotate")
//    }

    func logoDidRotate(_ direction: CGFloat, _: SCNAnimation, _: SCNAnimatable, _: Bool) -> Void {
//        self.logoShouldRotate(direction: direction)
    }
}
