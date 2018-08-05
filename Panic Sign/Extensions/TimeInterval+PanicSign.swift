import Foundation

extension TimeInterval {
    static let fiveMinutes: TimeInterval = TimeInterval(minutes: 5)

    init(minutes: Int, seconds: Int = 0) {
        self = TimeInterval(minutes) * 60 + TimeInterval(seconds)
    }
}
