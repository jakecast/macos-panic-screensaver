import ScreenSaver
import SceneKit

class PanicSignView: ScreenSaverView {
    lazy var sceneView: PanicSceneView = PanicSceneView(frame: self.bounds)

    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }

    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        self.sceneView.prepare()
        self.addSubview(self.sceneView)
    }
//    override init?(frame: NSRect, isPreview: Bool) {
//        super.init(frame: frame, isPreview: isPreview)
//    }
//    override func draw(_ rect: NSRect) {
//        super.draw(rect)
//
//        NSColor.red.setFill()
//        self.bounds.fill()
//
//        NSColor.black.set()
//
//        let hello: NSString = "hello SWIFT screen saver plugin"
//        hello.draw(at: NSPoint(x: 100.0, y: 200.0), withAttributes: nil)
//    }
}

class PanicSceneView: SCNView {
    func prepare() {
        self.backgroundColor = .darkGray
        self.scene = SCNScene()
        self.prepareScene()
        self.addShape()
    }

    func prepareScene() {
        guard let scene = self.scene else {
            return
        }

        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0.0, y: 0.0, z: 25.0)


        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.position = SCNVector3(x: 0.0, y: 1000.0, z: 1000.0)


        let ambientNode = SCNNode()
        ambientNode.light = SCNLight()
        ambientNode.light?.type = .ambient
        ambientNode.light?.color = NSColor.darkGray

        scene.rootNode.addChildNode(cameraNode)
        scene.rootNode.addChildNode(lightNode)
        scene.rootNode.addChildNode(ambientNode)

        self.allowsCameraControl = true
        self.showsStatistics = true
    }

    func addShape() {
        guard let scene = self.scene else {
            return
        }
        let logo = Logo(size: 20.0)

        let upperPath = logo.drawUpperBackground()
        upperPath.lineJoinStyle = .round
        upperPath.flatness = 0.01

        let upperShape = SCNShape(path: upperPath, extrusionDepth: 2.0)
        upperShape.firstMaterial?.diffuse.contents = NSColor(red: 0.208, green: 0.773, blue: 0.882, alpha: 1)

        let lowerPath = logo.drawLowerBackground()
        lowerPath.lineJoinStyle = .round
        lowerPath.flatness = 0.01

        let lowerShape = SCNShape(path: lowerPath, extrusionDepth: 2.0)
        lowerShape.firstMaterial?.diffuse.contents = NSColor(red: 0.071, green: 0.439, blue: 0.576, alpha: 1)

        let centerPath = logo.drawLetter()
        centerPath.lineJoinStyle = .round
        centerPath.flatness = 0.01

        let centerShape = SCNShape(path: centerPath, extrusionDepth: 3)
        centerShape.firstMaterial?.diffuse.contents = NSColor.white

        let logoNode = SCNNode()
        logoNode.addChildNode(SCNNode(geometry: upperShape))
        logoNode.addChildNode(SCNNode(geometry: lowerShape))
        logoNode.addChildNode(SCNNode(geometry: centerShape))
        logoNode.position = SCNVector3(0.0, 0.0, 0.0)
        logoNode.rotation = SCNVector4(1.0, 1.0, 0.0, 0.0)

        scene.rootNode.addChildNode(logoNode)
    }
}

struct Logo {
    let size: NSSize
    let center: NSPoint
    let radius: CGFloat
    let inflection: CGFloat

    init(size: CGFloat) {
        self.radius = (size * 0.865) / 2.0
        self.inflection = size / 10.0
        self.size = NSSize(width: self.radius * 2.0, height: self.radius * 2.0)
        self.center = NSPoint(x: size / 2.0, y: size / 2.0)
    }

    func draw() {
        _ = self.drawLowerBackground()
        _ = self.drawUpperBackground()
        _ = self.drawLetter()
    }

    func drawUpperBackground() -> NSBezierPath {
        let path = NSBezierPath()
        path.move(to: self.position(loc: (x: 19.0, y: 4.0)))
        path.line(to: self.position(idx: 13.0))
        for pos in stride(from: CGFloat(13.0), to: CGFloat(23.0), by: 2.0) {
            path.curve(
                to: self.position(idx: pos + 2.0),
                controlPoint1: self.position(idx: pos + 0.50, inflected: true),
                controlPoint2: self.position(idx: pos + 1.50, inflected: true))
        }
        path.close()
        path.windingRule = .evenOdd
        return path
//        let fillColor = NSColor(red: 0.208, green: 0.773, blue: 0.882, alpha: 1)
//        fillColor.setFill()
//        path.fill()
    }

    func drawLowerBackground() -> NSBezierPath {
        let path = NSBezierPath()
        path.move(to: self.position(loc: (x: 19.0, y: 4.0)))
        path.line(to: self.position(idx: 3))
        for pos in stride(from: CGFloat(3.0), to: CGFloat(13.0), by: 2.0) {
            path.curve(
                to: self.position(idx: pos + 2.0),
                controlPoint1: self.position(idx: pos + 0.50, inflected: true),
                controlPoint2: self.position(idx: pos + 1.50, inflected: true))
        }
        path.close()
        path.windingRule = .evenOdd
        return path
//        let fillColor = NSColor(red: 0.071, green: 0.439, blue: 0.576, alpha: 1)
//        fillColor.setFill()
//        path.fill()
    }

    func drawLetter() -> NSBezierPath {
        var coords: [NSPoint] = Array(repeating: .zero, count: 10)
        let lean: CGFloat = 0.1911467822
        let anchors: (top: NSPoint, bottom: NSPoint) = (
            top: self.position(idx: 3.0),
            bottom: self.position(idx: 13.0))
        let outsize: CGSize = CGSize(
            width: anchors.top.x - anchors.bottom.x,
            height: anchors.top.y - anchors.bottom.y)
        let insize: CGSize = CGSize(
            width: outsize.width * 0.4630380647,
            height: outsize.height * 0.2478704023)
        let legr: (w: CGFloat, h: CGFloat) = (
            w: 0.6482390608,
            h: 0.2394504899)

        coords[4] = anchors.bottom
        coords[6] = anchors.top

        coords[5].y = coords[6].y
        coords[5].x = coords[4].x + (outsize.height * lean)

        coords[7].y = coords[4].y + (outsize.height * legr.h)
        coords[7].x = coords[6].x - (lean * (coords[6].y - coords[7].y))

        coords[8].y = coords[7].y
        coords[8].x = coords[7].x - (outsize.width * legr.w)

        coords[9].y = coords[4].y
        coords[9].x = coords[8].x - (lean * (coords[8].y - coords[9].y))

        coords[0].y = coords[8].y + ((coords[5].y - coords[8].y) / 2.0) - (insize.height / 2.0)
        coords[0].x = coords[8].x + (lean * (coords[0].y - coords[8].y))

        coords[1].y = coords[0].y + insize.height
        coords[1].x = coords[0].x + (insize.height * lean)

        coords[2].y = coords[1].y
        coords[2].x = coords[0].x + insize.width

        coords[3].y = coords[0].y
        coords[3].x = coords[2].x - (insize.height * lean)

        let path = NSBezierPath()
        path.move(to: coords[0])
        path.line(to: coords[1])
        path.line(to: coords[2])
        path.line(to: coords[3])
        path.move(to: coords[4])
        path.line(to: coords[5])
        path.line(to: coords[6])
        path.line(to: coords[7])
        path.line(to: coords[8])
        path.line(to: coords[9])
        path.move(to: coords[4])

        path.close()

        path.windingRule = .evenOdd
        return path
//        let fillColor = NSColor.white
//        fillColor.setFill()
//        path.fill()
    }

    func position(idx: CGFloat, inflected: Bool = false) -> NSPoint {
        let pos = 5.0 - idx
        let radius = inflected ? self.radius + self.inflection : self.radius
        return NSPoint(
            x: self.center.x + radius * cos(18.0 * pos * (.pi / 180.0)),
            y: self.center.y + radius * sin(18.0 * pos * (.pi / 180.0)))
    }

    func position(loc: (x: CGFloat, y: CGFloat), inflected: Bool = false) -> NSPoint {
        let pos = (x: 5.0 - loc.x, y: 5.0 - loc.y)
        let radius = inflected ? self.radius + self.inflection : self.radius
        return NSPoint(
            x: self.center.x + radius * cos(18.0 * pos.x * (.pi / 180.0)),
            y: self.center.y + radius * sin(18.0 * pos.y * (.pi / 180.0)))
    }
}
