import Cocoa

extension NSRect {
    func fill(color: NSColor, using operation: NSCompositingOperation = .clear) {
        color.set()
        self.fill(using: operation)
    }
}
