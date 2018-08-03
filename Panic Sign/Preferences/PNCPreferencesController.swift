import AppKit
import ScreenSaver

class PNCPreferencesController: NSWindowController {
    convenience init() {
        self.init(window: nil)
    }

    override var windowNibName: NSNib.Name? {
        return NSNib.Name("PNCPreferencesController")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction
    func handleOkayButton(_ sender: Any?) {
        self.window?.close()
    }
}
