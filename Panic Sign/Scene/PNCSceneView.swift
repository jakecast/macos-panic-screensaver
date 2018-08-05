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

        let cameraNode = SCNNode(name: "cameraNode")
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0.0, y: 0.0, z: 25.0)


        let lightNode = SCNNode(name: "lightNode")
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0.0, y: 500.0, z: 1000.0)


        let ambientNode = SCNNode(name: "ambientNode")
        ambientNode.light = SCNLight()
        ambientNode.light?.type = .ambient
        ambientNode.light?.nscolor = .darkGray

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
