import Foundation

extension UserDefaults {
    func bool(option: PNCUserOption) -> Bool {
        return self.bool(forKey: option.rawValue)
    }

    func color(option: PNCUserOption) -> PNCLogoColor {
        guard let color = PNCLogoColor(rawValue: self.integer(forKey: option.rawValue)) else {
            fatalError("\(option.rawValue) not set")
        }
        return color
    }

    func register(panicUserOptions: [PNCUserOption : Any]) {
        self.register(defaults: panicUserOptions.transform({ ($0.rawValue, $1) }))
        for (key, value) in panicUserOptions {
            if self.value(forKey: key.rawValue) != nil {
                continue
            }
            self.set(value, forKey: key.rawValue)
        }
    }

    func reset() {
        for (key, _) in self.dictionaryRepresentation() {
            self.removeObject(forKey: key)
        }
    }

    func set(_ value: Int, option: PNCUserOption) {
        self.set(value, forKey: option.rawValue)
    }

    func set(_ value: Bool, option: PNCUserOption) {
        self.set(value, forKey: option.rawValue)
    }
}
