import SceneKit

extension SCNGeometry {
    var color: NSColor? {
        get { return self.firstMaterial?.diffuse.contents as? NSColor }
        set { self.firstMaterial?.diffuse.contents = newValue }
    }
}
