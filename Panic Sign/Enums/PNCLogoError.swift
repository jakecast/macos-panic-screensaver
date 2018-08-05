import Foundation

enum PNCLogoError: Error {
    case genericError(Error?)
    case unableToDecodeJSON
}
