import Foundation

enum PNCUserOption: String {
    case topColor = "topColor"
    case bottomColor = "bottomColor"
    case usePanicSignColors = "usePanicSignColors"
    case showDebugInfo = "showDebugInfo"
    case showTime = "showTime"

    static var defaults: [PNCUserOption : Any] {
        return [
            .topColor: PNCLogoColor.panicSeafoam.rawValue,
            .bottomColor: PNCLogoColor.panicBlue.rawValue,
            .usePanicSignColors: false,
            .showDebugInfo: false,
            .showTime: false, ]
    }
}
