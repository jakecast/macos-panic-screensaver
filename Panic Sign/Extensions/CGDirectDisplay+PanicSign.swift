import Cocoa

extension CGDirectDisplayID {
    static var allDisplays: [CGDirectDisplayID] {
        var onlineDisplays: [CGDirectDisplayID] = Array(repeating: 0, count: 16)
        var displayCount: UInt32 = 0
        let _ = CGGetOnlineDisplayList(16, &onlineDisplays, &displayCount)
        return onlineDisplays.filter({ $0 != 0 })
    }

    static var numberOfDisplays: Int {
        return self.allDisplays.count
    }
}
