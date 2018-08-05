import Foundation

extension URL {
    static let panicSignURL: URL = URL(absoluteString: "https://signserver.panic.com/get/string")

    init(absoluteString: String) {
        guard let url = URL(string: absoluteString) else {
            fatalError("unable to init url: \(absoluteString)")
        }
        self = url
    }
}
