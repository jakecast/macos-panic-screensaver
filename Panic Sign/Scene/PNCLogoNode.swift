import SceneKit

class PNCLogoNode: SCNNode {
    var flatNode: SCNNode {
        return self.flattenedNode()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init() {
        super.init()
    }

    convenience init?(opts: PNCLogoOptions) {
        guard opts.isValid else {
            return nil
        }
        self.init()
        self.draw(opts: opts)
    }

    func draw(opts: PNCLogoOptions) {
        let topPath = PNCTopPath(
            opts: opts)
        let topShape = SCNShape(
            path: topPath,
            extrusionDepth: 2.0,
            color: .panicSeafoam)
        let topNode = SCNNode(
            geometry: topShape)

        let bottomPath = PNCBottomPath(
            opts: opts)
        let bottomShape = SCNShape(
            path: bottomPath,
            extrusionDepth: 2.0,
            color: .panicBlue)
        let bottomNode = SCNNode(
            geometry: bottomShape)

        let letterPath = PNCLetterPath(
            opts: opts)
        let letterShape = SCNShape(
            path: letterPath,
            extrusionDepth: 5.0,
            color: .white)
        let letterNode = SCNNode(
            geometry: letterShape)

        self.addChildNode(topNode)
        self.addChildNode(bottomNode)
        self.addChildNode(letterNode)
    }

    func flattenedNode() -> Self {
        let node = self.flattenedClone()
        node.position = SCNVector3(0.0, 0.0, 0.0)
        node.rotation = SCNVector4(1.0, 1.0, 0.0, 0.0)
        return node
    }
}
