import Cocoa

class PNCBottomPath: NSBezierPath, PNCPathProtocol {
    var opts: PNCLogoOptions?

    func draw() {
        self.move(to: self.origin)
        self.line(to: self.position(hour: 3))
        self.curve(
            to: self.position(hour: 5),
            controlPoint1: self.position(hour: 3, offset: 0.50, inflected: true),
            controlPoint2: self.position(hour: 3, offset: 1.50, inflected: true))
        self.curve(
            to: self.position(hour: 7),
            controlPoint1: self.position(hour: 5, offset: 0.50, inflected: true),
            controlPoint2: self.position(hour: 5, offset: 1.50, inflected: true))
        self.curve(
            to: self.position(hour: 9),
            controlPoint1: self.position(hour: 7, offset: 0.50, inflected: true),
            controlPoint2: self.position(hour: 7, offset: 1.50, inflected: true))
        self.curve(
            to: self.position(hour: 11),
            controlPoint1: self.position(hour: 9, offset: 0.50, inflected: true),
            controlPoint2: self.position(hour: 9, offset: 1.50, inflected: true))
        self.curve(
            to: self.position(hour: 13),
            controlPoint1: self.position(hour: 11, offset: 0.50, inflected: true),
            controlPoint2: self.position(hour: 11, offset: 1.50, inflected: true))
        self.close()
    }
}
