import Cocoa

extension NSColor {
    class var userTopColor: NSColor {
        return PNCUserPreferences.shared.topColor
    }

    class var userBottomColor: NSColor {
        return PNCUserPreferences.shared.bottomColor
    }

    class var panicBlue: NSColor {
        return NSColor(red:0.12, green:0.58, blue:0.76, alpha:1.0)
    }

    class var panicGreen: NSColor {
        return NSColor(red:0.10, green:0.93, blue:0.31, alpha:1.0)
    }

    class var panicLemon: NSColor {
        return NSColor(red:0.69, green:0.95, blue:0.04, alpha:1.0)
    }

    class var panicNavy: NSColor {
        return NSColor(red:0.07, green:0.44, blue:0.58, alpha:1.0)
    }

    class var panicOrange: NSColor {
        return NSColor(red:0.95, green:0.49, blue:0.09, alpha:1.0)
    }

    class var panicPink: NSColor {
        return NSColor(red:0.76, green:0.41, blue:0.73, alpha:1.0)
    }

    class var panicPurple: NSColor {
        return NSColor(red:0.51, green:0.40, blue:0.78, alpha:1.0)
    }

    class var panicRed: NSColor {
        return NSColor(red:0.99, green:0.26, blue:0.29, alpha:1.0)
    }

    class var panicSeafoam: NSColor {
        return NSColor(red:0.45, green:0.84, blue:0.91, alpha:1.0)
    }

    class var panicTeal: NSColor {
        return NSColor(red:0.44, green:0.84, blue:0.73, alpha:1.0)
    }

    class var panicYellow: NSColor {
        return NSColor(red:1.00, green:0.80, blue:0.34, alpha:1.0)
    }
}
