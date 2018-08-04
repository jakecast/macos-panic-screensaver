import ScreenSaver

struct PNCUserPreferences {
    let defaults: ScreenSaverDefaults

    var topColorName: String {
        guard let name = self.defaults.string(forKey: "topColor") else {
            fatalError("top color preference not set")
        }
        return name
    }

    var topColor: NSColor {
        guard let color = NSColor(named: self.topColorName) else {
            return .panicSeafoam
        }
        return color
    }

    var bottomColor: NSColor {
        guard let name = self.defaults.string(forKey: "panicBlue"), let color = NSColor(named: name) else {
            return .panicBlue
        }
        return color
    }

    init() {
        guard let id = PNCUserPreferences.bundle.bundleIdentifier, let defaults = ScreenSaverDefaults(forModuleWithName: id) else {
            fatalError("failed to load user preferences")
        }
        self.defaults = defaults
        self.register([
            .topColor: "panicSeafoam",
            .bottomColor: "panicBlue",
        ])
    }

    func register(_ defaults: [PNCUserOption : Any]) {
        self.defaults.register(defaults: defaults.transform({ ($0.rawValue, $1) }))
    }

    func set(value: Any, key: PNCUserOption) {
        self.defaults.set(value, forKey: key.rawValue)
    }
}

extension PNCUserPreferences {
    static var bundle = Bundle(for: PNCScreenSaver.self)
    static var shared = PNCUserPreferences()
}
