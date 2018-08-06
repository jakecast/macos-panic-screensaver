import AppKit
import ScreenSaver

class PNCPreferencesController: NSWindowController {
    @IBOutlet
    weak var topColorButton: NSPopUpButton!
    @IBOutlet
    weak var bottomColorButton: NSPopUpButton!
    @IBOutlet
    weak var matchPanicSignButton: NSButton!

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
    }

    func matchButtonStateNeedsUpdate() {
        self.matchPanicSignButton.state = self.preferences.usePanicSignColors ? .on : .off
    }

    func popUpButtonEnabledNeedsUpdate() {
        self.topColorButton.isEnabled = self.preferences.usePanicSignColors ? false : true
        self.bottomColorButton.isEnabled = self.preferences.usePanicSignColors ? false : true
    }

    func popUpButtonColorsNeedUpdate() {
        self.topColorButton.selectItem(withTag: self.preferences.topColorTag)
        self.bottomColorButton.selectItem(withTag: self.preferences.bottomColorTag)
    }

    @IBAction
    func selectTopColor(_ popUpButton: NSPopUpButton) {
        guard let tag = popUpButton.selectedItem?.tag else {
            return
        }
        self.preferences.set(colorTag: tag, key: .topColor)
    }

    @IBAction
    func selectBottomColor(_ popUpButton: NSPopUpButton) {
        guard let tag = popUpButton.selectedItem?.tag else {
            return
        }
        self.preferences.set(colorTag: tag, key: .bottomColor)
    }

    @IBAction
    func handleMatchPanicSignButton(_ matchButton: NSButton) {
//        self.preferences.set
    }

    @IBAction
    func handleOkayButton(_ sender: Any?) {
        self.window?.close()
    }
}
