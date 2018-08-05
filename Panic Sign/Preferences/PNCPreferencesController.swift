import AppKit
import ScreenSaver

class PNCPreferencesController: NSWindowController {
    @IBOutlet
    weak var topColorButton: NSPopUpButton!
    @IBOutlet
    weak var bottomColorButton: NSPopUpButton!
    
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
        self.popUpButtonsNeedUpdate()
    }

    func popUpButtonsNeedUpdate() {
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
    func handleOkayButton(_ sender: Any?) {
        self.window?.close()
    }
}
