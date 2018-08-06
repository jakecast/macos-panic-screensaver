import AppKit
import ScreenSaver

class PNCPreferencesController: NSWindowController {
    @IBOutlet
    weak var topColorButton: NSPopUpButton!
    @IBOutlet
    weak var bottomColorButton: NSPopUpButton!
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

    convenience init() {
        self.init(window: nil)
    }

    override var windowNibName: NSNib.Name? {
        return NSNib.Name("PNCPreferencesController")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
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
        if self.preferences.topColorTag != self.topColorButton.selectedItem?.tag {
            self.topColorButton.selectItem(withTag: self.preferences.topColorTag)
        }
        if self.preferences.bottomColorTag != self.bottomColorButton.selectedItem?.tag {
            self.bottomColorButton.selectItem(withTag: self.preferences.bottomColorTag)
        }
    }

    @IBAction
    func selectTopColor(_ popUpButton: NSPopUpButton) {
        guard let tag = popUpButton.selectedItem?.tag else {
            return
        }
        self.preferences.setColor(tag: tag, key: .topColor)
    }

    @IBAction
    func selectBottomColor(_ popUpButton: NSPopUpButton) {
        guard let tag = popUpButton.selectedItem?.tag else {
            return
        }
        self.preferences.setColor(tag: tag, key: .bottomColor)
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
        self.window?.close()
    }

    @objc
    func preferencesDidChange(_ notification: NSNotification?) {
        self.popUpButtonColorsNeedUpdate()
    }
}
