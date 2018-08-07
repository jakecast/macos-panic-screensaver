import Foundation

extension Bool {
    static var hasMultipleDisplays: Bool {
        return Int.numberOfDisplays > 1
    }

    static var isUsingPowerAdapter: Bool {
        return IOPMPowerFlags.isUsingPowerAdapter
    }

    static var showDebugInfo: Bool {
        return PNCUserPreferences.shared.showDebugInfo
    }

    static var usePanicSignColors: Bool {
        return PNCUserPreferences.shared.usePanicSignColors
    }

    static var wantsDiscreteGraphics: Bool {
        return .hasMultipleDisplays && .isUsingPowerAdapter
    }

    static var wantsLowerPowerGraphics: Bool {
        return !.wantsDiscreteGraphics
    }
}
