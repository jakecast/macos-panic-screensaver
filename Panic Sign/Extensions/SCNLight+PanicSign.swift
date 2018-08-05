import SceneKit

extension SCNLight {
    var nscolor: NSColor? {
        get { return self.color as? NSColor }
        set { self.color = newValue as Any }
    }
}
