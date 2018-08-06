import ScreenSaver

struct PNCUserPreferences {
    let defaults: ScreenSaverDefaults

    lazy var networkManager: PNCNetworkManager = PNCNetworkManager(preferences: self)

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

    var usePanicSignColors: Bool {
        return self.bool(option: .usePanicSignColors)
    }

    var notificationCenter: NotificationCenter {
        return .default
    }

    init() {
        guard let id = PNCUserPreferences.bundle.bundleIdentifier, let defaults = ScreenSaverDefaults(forModuleWithName: id) else {
            fatalError("failed to load user preferences")
        }
        self.defaults = defaults
        self.register(PNCUserOption.defaults)
    }

    func bool(option: PNCUserOption) -> Bool {
        return self.defaults.bool(forKey: option.rawValue)
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

    func set(colorTag: Int, key: PNCUserOption) {
        guard colorTag != self.color(option: key).rawValue else {
            return
        }
        self.defaults.set(colorTag, forKey: key.rawValue)
        self.notificationCenter.post(name: .preferencesDidChange)
    }
}

extension PNCUserPreferences {
    static let bundle = Bundle(for: PNCScreenSaver.self)
    static let shared = PNCUserPreferences()
}
