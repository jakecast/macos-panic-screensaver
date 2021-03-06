import SceneKit

extension SCNNode {
    convenience init(name: String) {
        self.init()
        self.name = name
    }

    func addTo(parentNode: SCNNode) {
        parentNode.addChildNode(self)
    }
}
