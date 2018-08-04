import AppKit

enum PNCLogoColor: Int {
    case panicRed = 1
    case panicYellow = 2
    case panicOrange = 3
    case panicLemon = 4
    case panicGreen = 5
    case panicTeal = 6
    case panicSeafoam = 7
    case panicBlue = 8
    case panicNavy = 9
    case panicPurple = 10
    case panicPink = 11

    init?(_ name: String) {
        switch name {
        case "panicRed":
            self = .panicRed
        case "panicYellow":
            self = .panicYellow
        case "panicOrange":
            self = .panicOrange
        case "panicLemon":
            self = .panicLemon
        case "panicGreen":
            self = .panicGreen
        case "panicTeal":
            self = .panicTeal
        case "panicSeafoam":
            self = .panicSeafoam
        case "panicBlue":
            self = .panicBlue
        case "panicNavy":
            self = .panicNavy
        case "panicPurple":
            self = .panicPurple
        case "panicPink":
            self = .panicPink
        case _:
            return nil
        }
    }

    var colorVal: NSColor {
        switch self {
        case .panicRed:
            return .panicRed
        case .panicYellow:
            return .panicYellow
        case .panicOrange:
            return .panicOrange
        case .panicLemon:
            return .panicLemon
        case .panicGreen:
            return .panicGreen
        case .panicTeal:
            return .panicTeal
        case .panicSeafoam:
            return .panicSeafoam
        case .panicBlue:
            return .panicBlue
        case .panicNavy:
            return .panicNavy
        case .panicPurple:
            return .panicPurple
        case .panicPink:
            return .panicPink
        }
    }
}
