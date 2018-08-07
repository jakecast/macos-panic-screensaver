import SceneKit

class PNCSceneView: SCNView {
    var isAnimating: Bool = false
    var logoNode: SCNNode?

    lazy var logoOptions: PNCLogoGeometry = PNCLogoGeometry(area: 20.0)

    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }

    init(frame: NSRect, opts: [SCNView.Option : SCNViewSetting]? = nil) {
        super.init(frame: frame, options: opts?.transform({ ($0.rawValue, $1.rawValue) }))
        self.setup()
    }

    func unload() {
        guard let node = self.logoNode else {
            return
        }
        node.removeAllAnimations()
    }

    func setup() {
        self.backgroundColor = .black
        self.scene = SCNScene()
        self.setupLighting()
        self.drawLogoNode()
        self.animateScene()
    }

    func setupLighting() {
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

        self.showsStatistics = .showDebugInfo
    }

    func drawLogoNode() {
        guard let scene = self.scene else {
            fatalError("missing scene")
        }
        guard let node = PNCLogoNode(opts: self.logoOptions) else {
            fatalError("invalid logo options")
        }
        self.logoNode = node.flatNode
        self.logoNode?.addTo(parentNode: scene.rootNode)
    }

    func animateScene() {
        guard let node = self.logoNode, !self.isAnimating else {
            return
        }
        self.isAnimating = true
        self.runAnimation(node: node)
    }

    func runAnimation(node: SCNNode, offset: Int = 1) {
        SCNTransaction.begin()
        SCNTransaction.animationDuration = 10.0
        SCNTransaction.animationTimingFunction = .linear
        SCNTransaction.completionBlock = { [weak self] in self?.animationDidEnd(node: node, offset: offset) }
        node.position.x = .random(in: -5.0 ... 5.0)
        node.position.y = .random(in: -5.0 ... 5.0)
        node.rotation.w = .random(in: 0.25 ... 0.35) * .pi * CGFloat(offset)
        SCNTransaction.commit()
    }

    func animationDidEnd(node: SCNNode, offset: Int) {
        self.runAnimation(node: node, offset: offset * -1)
    }
}
