import AppKit
import ScreenSaver

class PNCPreferencesController: NSWindowController {
    @IBOutlet
    weak var topColorButton: PNCPopUpButton!
    @IBOutlet
    weak var bottomColorButton: PNCPopUpButton!
    @IBOutlet
    weak var matchPanicSignButton: NSButton!
    @IBOutlet
    weak var showDebugInfo: NSButton!

    var notifier: NotificationCenter {
        return .default
    }

    var preferences: PNCUserPreferences {
        return .shared
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.debugButtonStateNeedsUpdate()
        self.matchButtonStateNeedsUpdate()
        self.popUpButtonEnabledNeedsUpdate()
        self.popUpButtonColorsNeedUpdate()
        self.notifier.addObserver(self, selector: #selector(preferencesDidChange), name: .preferencesDidChange, object: nil)
    }

    func debugButtonStateNeedsUpdate() {
        self.showDebugInfo.state = .showDebugInfo ? .on : .off
    }

    func matchButtonStateNeedsUpdate() {
        self.matchPanicSignButton.state = .usePanicSignColors ? .on : .off
    }

    func popUpButtonEnabledNeedsUpdate() {
        self.topColorButton.isEnabled = .usePanicSignColors ? false : true
        self.bottomColorButton.isEnabled = .usePanicSignColors ? false : true
    }

    func popUpButtonColorsNeedUpdate() {
        if self.preferences.topColorTag != self.topColorButton.selectedItemColorValue {
            self.topColorButton.selectItem(withColorValue: self.preferences.topColorTag)
        }
        if self.preferences.bottomColorTag != self.bottomColorButton.selectedItemColorValue {
            self.bottomColorButton.selectItem(withColorValue: self.preferences.bottomColorTag)
        }
    }

    @IBAction
    func selectTopColor(_ popUpButton: PNCPopUpButton) {
        self.preferences.setColor(tag: popUpButton.selectedItemColorValue, key: .topColor)
    }

    @IBAction
    func selectBottomColor(_ popUpButton: PNCPopUpButton) {
        self.preferences.setColor(tag: popUpButton.selectedItemColorValue, key: .bottomColor)
    }

    @IBAction
    func handleMatchPanicSignButton(_ matchButton: NSButton) {
        self.preferences.setUsePanicSignColors(enabled: matchButton.state == .on)
        self.popUpButtonEnabledNeedsUpdate()
    }

    @IBAction
    func handleShowDebugInfoButton(_ debugButton: NSButton) {
        self.preferences.setShowDebugInfo(enabled: debugButton.state == .on)
    }

    @IBAction
    func handleOkayButton(_ sender: Any?) {
        guard let window = self.window else {
            return
        }
        self.preferences.defaults.synchronize()
        self.window?.sheetParent?.endSheet(window)
    }

    @objc
    func preferencesDidChange(_ notification: NSNotification?) {
        self.popUpButtonColorsNeedUpdate()
    }
}
