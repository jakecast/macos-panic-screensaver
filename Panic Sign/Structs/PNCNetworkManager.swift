import Foundation

class PNCNetworkManager {
    var timer: Timer?
    var task: URLSessionDataTask?

    var preferences: PNCUserPreferences?

    var session: URLSession {
        return .shared
    }

    required init(preferences: PNCUserPreferences) {
        self.preferences = preferences
    }

    deinit {
        self.preferences = nil
    }

    func startPolling() {
        guard self.timer == nil else {
            return
        }
        self.timer = Timer.scheduledTimer(
            withTimeInterval: .fiveMinutes,
            repeats: true,
            block: { [weak self] in self?.signColorsWantsUpdate($0) })
        self.timer?.fire()
    }

    func stopPolling() {
        self.timer?.invalidate()
        self.timer = nil
    }

    func signColorsWantsUpdate(_ timer: Timer) {
        self.task?.cancel()
        self.task = self.session.jsonWithURL(
            url: .panicSignURL,
            queue: .main,
            completionHandler: { [weak self] in self?.didFetchSignColors(json: $0, response: $1, error: $2) })
        self.task?.resume()
    }

    func didFetchSignColors(json: Any?, response: URLResponse?, error: Error?) {
        guard error == nil else {
            return
        }
        guard let colors = json as? [String : String] else {
            return
        }
        guard let topColor = PNCLogoColor(colors[PNCUserOption.topColor.rawValue]) else {
            return
        }
        guard let bottomColor = PNCLogoColor(colors[PNCUserOption.bottomColor.rawValue]) else {
            return
        }
        self.preferences?.set(colorTag: topColor.rawValue, key: .topColor)
        self.preferences?.set(colorTag: bottomColor.rawValue, key: .bottomColor)
    }
}

