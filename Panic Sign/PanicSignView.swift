import ScreenSaver

class PanicSignView: ScreenSaverView {
    override func draw(_ rect: NSRect) {
        super.draw(rect)

        NSColor.red.setFill()
        self.bounds.fill()

        NSColor.black.set()

        let hello: NSString = "hello SWIFT screen saver plugin"
        hello.draw(at: NSPoint(x: 100.0, y: 200.0), withAttributes: nil)
    }
}
