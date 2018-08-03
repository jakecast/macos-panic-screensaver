import CoreGraphics

extension Int {
    var cgFloatVal: CGFloat {
        return CGFloat(self)
    }

    func asCGFloat() -> CGFloat {
        return self.cgFloatVal
    }
}
