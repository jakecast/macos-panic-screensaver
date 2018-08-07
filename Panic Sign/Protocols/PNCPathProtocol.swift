import Cocoa

protocol PNCPathProtocol {
    var opts: PNCLogoGeometry? { get set }

    func draw()
}

extension PNCPathProtocol where Self : NSBezierPath {
    init(opts: PNCLogoGeometry) {
        self.init()
        self.opts = opts
        self.flatness = 0
        self.draw()
    }

    var center: NSPoint {
        return self.opts!.center
    }

    var inflection: CGFloat {
        return self.opts!.inflection
    }

    var inset: CGFloat {
        return self.opts!.inset
    }

    var radius: CGFloat {
        return self.opts!.radius
    }

    var origin: NSPoint {
        return self.opts!.origin
    }

    func position(hour: Int, offset: CGFloat = 0.0, inflected: Bool = false) -> NSPoint {
        return self.opts!.position(hour: hour, offset: offset, inflected: inflected)
    }
}
