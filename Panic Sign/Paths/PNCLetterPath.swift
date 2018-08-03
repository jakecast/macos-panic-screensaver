import Cocoa

class PNCLetterPath: NSBezierPath, PNCPathProtocol {
    var opts: PNCLogoOptions?

    lazy var coords: [NSPoint] = self.makeCoords()

    func makeCoords() -> [NSPoint] {
        let anchors: (top: NSPoint, bottom: NSPoint) = (
            top: self.position(hour: 3),
            bottom: self.position(hour: 13))
        let size: CGSize = CGSize(
            width: anchors.top.x - anchors.bottom.x,
            height: anchors.top.y - anchors.bottom.y)
        let insize: CGSize = CGSize(
            size: size,
            ratio: .panicLetterInsize)
        let legsize: CGSize = CGSize(
            size: size,
            ratio: .panicLetterLegsize)

        var coords: [NSPoint] = Array(
            repeating: .zero,
            count: 10)

        coords[4] = anchors.bottom
        coords[6] = anchors.top

        coords[5].y = coords[6].y
        coords[5].x = coords[4].x + (size.height * .panicLetterAngle)

        coords[7].y = coords[4].y + legsize.height
        coords[7].x = coords[6].x - (.panicLetterAngle * (coords[6].y - coords[7].y))

        coords[8].y = coords[7].y
        coords[8].x = coords[7].x - legsize.width

        coords[9].y = coords[4].y
        coords[9].x = coords[8].x - (.panicLetterAngle * (coords[8].y - coords[9].y))

        coords[0].y = coords[8].y + ((coords[5].y - coords[8].y) / 2.0) - (insize.height / 2.0)
        coords[0].x = coords[8].x + (.panicLetterAngle * (coords[0].y - coords[8].y))

        coords[1].y = coords[0].y + insize.height
        coords[1].x = coords[0].x + (insize.height * .panicLetterAngle)

        coords[2].y = coords[1].y
        coords[2].x = coords[0].x + insize.width

        coords[3].y = coords[0].y
        coords[3].x = coords[2].x - (insize.height * .panicLetterAngle)
        
        return coords
    }

    func draw() {
        self.move(to: self.coords[0])
        self.line(to: self.coords[1])
        self.line(to: self.coords[2])
        self.line(to: self.coords[3])

        self.move(to: self.coords[4])
        self.line(to: self.coords[5])
        self.line(to: self.coords[6])
        self.line(to: self.coords[7])
        self.line(to: self.coords[8])
        self.line(to: self.coords[9])

        self.move(to: self.coords[4])
        self.close()
    }
}
