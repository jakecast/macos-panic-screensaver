import AppKit
import ScreenSaver

class PNCPreferencesController: NSWindowController {
    let preferences: PNCUserPreferences = .shared

    weak var screenSaver: PNCScreenSaver?

    @IBOutlet
    weak var topColorButton: NSPopUpButton!

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
        self.topColorButton.selectItem(withIdentifier: self.preferences.topColorName)
    }

    @IBAction
    func selectTopColor(_ popUpButton: NSPopUpButton) {
        guard let name = popUpButton.selectedItem?.identifier?.rawValue else {
            return
        }
        self.preferences.set(value: name, key: .topColor)
        self.screenSaver?.redrawScene()
    }

    @IBAction
    func handleOkayButton(_ sender: Any?) {
        self.window?.close()
    }
}
