import Cocoa

class PNCTopPath: NSBezierPath, PNCPathProtocol {
    var opts: PNCLogoOptions?

    func draw() {
        self.move(to: self.origin)
        self.line(to: self.position(hour: 13))
        self.curve(
            to: self.position(hour: 15),
            controlPoint1: self.position(hour: 13, offset: 0.50, inflected: true),
            controlPoint2: self.position(hour: 13, offset: 1.50, inflected: true))
        self.curve(
            to: self.position(hour: 17),
            controlPoint1: self.position(hour: 15, offset: 0.50, inflected: true),
            controlPoint2: self.position(hour: 15, offset: 1.50, inflected: true))
        self.curve(
            to: self.position(hour: 19),
            controlPoint1: self.position(hour: 17, offset: 0.50, inflected: true),
            controlPoint2: self.position(hour: 17, offset: 1.50, inflected: true))
        self.curve(
            to: self.position(hour: 21),
            controlPoint1: self.position(hour: 19, offset: 0.50, inflected: true),
            controlPoint2: self.position(hour: 19, offset: 1.50, inflected: true))
        self.curve(
            to: self.position(hour: 23),
            controlPoint1: self.position(hour: 21, offset: 0.50, inflected: true),
            controlPoint2: self.position(hour: 21, offset: 1.50, inflected: true))
        self.close()
    }
}
