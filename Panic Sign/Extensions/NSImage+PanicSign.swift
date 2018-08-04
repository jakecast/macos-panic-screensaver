import AppKit

extension NSImage {
    var bounds: NSRect {
        return NSRect(origin: .zero, size: self.size)
    }

    func imageWithTintColor(_ color: NSColor) -> NSImage {
        guard let image = self.copy() as? NSImage else {
            return self
        }
        image.lockFocus()
        image.bounds.fill(color: color, using: .sourceAtop)
        image.unlockFocus()
        image.isTemplate = false
        return image
    }
}
