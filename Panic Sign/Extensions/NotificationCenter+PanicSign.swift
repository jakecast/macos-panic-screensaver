import Foundation

extension NotificationCenter {
    func post(name: Notification.Name) {
        self.post(name: name, object: nil)
    }
}
