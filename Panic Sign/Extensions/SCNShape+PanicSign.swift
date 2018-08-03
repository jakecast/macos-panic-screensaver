import SceneKit

extension SCNShape {
    convenience init(path: NSBezierPath?, extrusionDepth: CGFloat, color: NSColor) {
        self.init(path: path, extrusionDepth: extrusionDepth)
        self.color = color
    }
}
