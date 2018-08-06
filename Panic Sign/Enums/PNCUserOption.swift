import Foundation

enum PNCUserOption: String {
    case topColor
    case bottomColor
    case usePanicSignColors
    case showDebugInfo
    case showTime

    static var defaults: [PNCUserOption : Any] {
        return [
            .topColor: PNCLogoColor.panicSeafoam.rawValue,
            .bottomColor: PNCLogoColor.panicBlue.rawValue,
            .usePanicSignColors: false,
            .showDebugInfo: false,
            .showTime: false,
        ]
    }
}
