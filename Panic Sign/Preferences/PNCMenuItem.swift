import AppKit

@IBDesignable
class PNCMenuItem: NSMenuItem {
    @IBInspectable
    var imageTintColor: NSColor?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageTintColorNeedsUpdate()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.imageTintColorNeedsUpdate()
    }

    func imageTintColorNeedsUpdate() {
        guard let image = self.image, let color = self.imageTintColor else  {
            return
        }
        self.image = image.imageWithTintColor(color)
    }
}
