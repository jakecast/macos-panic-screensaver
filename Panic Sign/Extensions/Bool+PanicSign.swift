import Foundation

extension Bool {
    static var usePanicSignColors: Bool {
        return PNCUserPreferences.shared.usePanicSignColors
    }

    static var showDebugInfo: Bool {
        return PNCUserPreferences.shared.showDebugInfo
    }
}
