import ScreenSaver

struct PNCUserPreferences {
    let defaults: ScreenSaverDefaults

    var topColor: NSColor {
        return self.color(option: .topColor).colorVal
    }

    var topColorTag: Int {
        return self.color(option: .topColor).rawValue
    }

    var bottomColor: NSColor {
        return self.color(option: .bottomColor).colorVal
    }

    var bottomColorTag: Int {
        return self.color(option: .bottomColor).rawValue
    }

    init() {
        guard let id = PNCUserPreferences.bundle.bundleIdentifier, let defaults = ScreenSaverDefaults(forModuleWithName: id) else {
            fatalError("failed to load user preferences")
        }
        self.defaults = defaults
        self.register([
            .topColor: PNCLogoColor.panicSeafoam.rawValue,
            .bottomColor: PNCLogoColor.panicBlue.rawValue,
        ])
    }

    func color(option: PNCUserOption) -> PNCLogoColor {
        guard let color = PNCLogoColor(rawValue: self.defaults.integer(forKey: option.rawValue)) else {
            fatalError("\(option.rawValue) not set")
        }
        return color
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
