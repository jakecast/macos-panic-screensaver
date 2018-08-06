import AppKit

extension NSView {
    func addTo(superview: NSView) {
        superview.addSubview(self)
    }
}
