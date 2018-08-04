import AppKit
import ScreenSaver

class PNCPreferencesController: NSWindowController {
    let preferences: PNCUserPreferences = .shared

    weak var screenSaver: PNCScreenSaver?

    @IBOutlet
    weak var topColorButton: NSPopUpButton!

    @IBOutlet
    weak var bottomColorButton: NSPopUpButton!

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
        guard let name = popUpButton.selectedItem?.tag else {
            return
        }
        self.preferences.set(value: name, key: .topColor)
        self.screenSaver?.redrawScene()
    }

    @IBAction
    func selectBottomColor(_ popUpButton: NSPopUpButton) {
        guard let name = popUpButton.selectedItem?.tag else {
            return
        }
        self.preferences.set(value: name, key: .bottomColor)
        self.screenSaver?.redrawScene()
    }

    @IBAction
    func handleOkayButton(_ sender: Any?) {
        self.window?.close()
    }
}
