import AppKit

enum PNCLogoColor: Int {
    case panicRed = 1
    case panicOrange = 2
    case panicYellow = 3
    case panicLemon = 4
    case panicGreen = 5
    case panicTeal = 6
    case panicSeafoam = 7
    case panicBlue = 8
    case panicNavy = 9
    case panicPurple = 10
    case panicPink = 11

    init?(_ name: String?) {
        guard let name = name else {
            return nil
        }
        switch name {
        case "panicRed", "red":
            self = .panicRed
        case "panicYellow", "yellow":
            self = .panicYellow
        case "panicOrange", "orange":
            self = .panicOrange
        case "panicLemon", "green":
            self = .panicLemon
        case "panicGreen", "green2":
            self = .panicGreen
        case "panicTeal", "teal":
            self = .panicTeal
        case "panicSeafoam", "lightblue":
            self = .panicSeafoam
        case "panicBlue", "blue":
            self = .panicBlue
        case "panicNavy", "darkblue":
            self = .panicNavy
        case "panicPurple", "purple":
            self = .panicPurple
        case "panicPink", "pink":
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
