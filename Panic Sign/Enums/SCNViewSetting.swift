import Foundation
import SceneKit

enum SCNViewSetting {
    case bool(Bool)
    case rendering(SCNRenderingAPI)
    case device(MTLDevice)

    var rawValue: Any {
        switch self {
        case .bool(let value):
            return NSNumber(value: value)
        case .rendering(let api):
            return NSNumber(value: api.rawValue)
        case .device(let device):
            return device
        }
    }
}
