import ScreenSaver

struct PNCUserPreferences {
    let defaults: ScreenSaverDefaults
    let networkManager: PNCNetworkManager = PNCNetworkManager()

    var topColor: NSColor {
        return self.defaults.color(option: .topColor).colorVal
    }
    
    var topColorTag: Int {
        return self.defaults.color(option: .topColor).rawValue
    }

    var bottomColor: NSColor {
        return self.defaults.color(option: .bottomColor).colorVal
    }

    var bottomColorTag: Int {
        return self.defaults.color(option: .bottomColor).rawValue
    }

    var usePanicSignColors: Bool {
        return self.defaults.bool(option: .usePanicSignColors)
    }

    var showDebugInfo: Bool {
        return self.defaults.bool(option: .showDebugInfo)
    }

    var notificationCenter: NotificationCenter {
        return .default
    }

    init() {
        guard let id = PNCUserPreferences.bundle.bundleIdentifier, let defaults = ScreenSaverDefaults(forModuleWithName: id) else {
            fatalError("failed to load user preferences")
        }
        self.defaults = defaults
        self.defaults.register(panicUserOptions: PNCUserOption.defaults)
        self.networkManager.updatePolling(enabled: self.usePanicSignColors)
    }

    func setColor(tag: Int, key: PNCUserOption) {
        guard tag != self.defaults.color(option: key).rawValue else {
            return
        }
        self.defaults.set(tag, option: key)
        self.notificationCenter.post(name: .preferencesDidChange)
    }

    func setUsePanicSignColors(enabled: Bool) {
        guard self.usePanicSignColors != enabled else {
            return
        }
        self.defaults.set(enabled, option: .usePanicSignColors)
        self.networkManager.updatePolling(enabled: enabled)
    }

    func setShowDebugInfo(enabled: Bool) {
        guard self.showDebugInfo != enabled else {
            return
        }
        self.defaults.set(enabled, option: .showDebugInfo)
        self.notificationCenter.post(name: .preferencesDidChange)
    }
}

extension PNCUserPreferences {
    static let bundle = Bundle(for: PNCScreenSaver.self)
    static let shared = PNCUserPreferences()
}
