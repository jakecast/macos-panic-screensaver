import Foundation

struct PNCLogoGeometry {
    let radius: CGFloat
    let inflection: CGFloat
    let inset: CGFloat
    let size: NSSize
    let center: NSPoint

    var origin: NSPoint = .zero

    var isValid: Bool {
        return self.radius != 0.0
    }

    init(area: CGFloat) {
        self.radius = (area * .panicCircleScale) / 2.0
        self.inflection = area / 10.0
        self.inset = area / 2.0
        self.size = NSSize(width: self.radius * 2.0, height: self.radius * 2.0)
        self.center = NSPoint(x: (area / 2.0) - self.inset, y: (area / 2.0) - self.inset)
        self.origin = NSPoint(x: self.position(hour: 19).x, y: self.position(hour: 4).y)
    }

    func position(hour: Int, offset: CGFloat = 0.0, inflected: Bool = false) -> NSPoint {
        let point: CGFloat = 5.0 - (CGFloat(hour) + offset)
        let radius: CGFloat = inflected ? self.radius + self.inflection : self.radius
        return NSPoint(
            x: self.center.x + radius * cos(18.0 * point * .pi / 180.0),
            y: self.center.y + radius * sin(18.0 * point * .pi / 180.0))
    }
}
