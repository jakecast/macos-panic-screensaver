import CoreGraphics

extension Int {
    static var numberOfDisplays: Int {
        return CGDirectDisplayID.numberOfDisplays
    }

    var cgFloatVal: CGFloat {
        return CGFloat(self)
    }

    func asCGFloat() -> CGFloat {
        return self.cgFloatVal
    }
}
