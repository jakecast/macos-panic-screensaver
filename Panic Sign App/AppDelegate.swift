import Cocoa
import ScreenSaver

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    lazy var screenSaver: PNCScreenSaver? = PNCScreenSaver(frame: self.windowBounds, isPreview: false)
    lazy var windowBounds: NSRect = self.window.contentView?.bounds ?? .zero

    @IBOutlet
    weak var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        guard let contentView = self.window.contentView, let screenSaver = self.screenSaver else {
            fatalError("missing content view or screensaver view")
        }
        contentView.addSubview(screenSaver)
        screenSaver.startAnimation()
    }

    @IBAction
    func handlePreferencesMenuItem(_ sender: Any?) {
        guard let screenSaver = self.screenSaver, let configure = screenSaver.configureSheet else {
            return
        }
        self.window.beginSheet(configure, completionHandler: {[weak configure] (response) in
            configure?.close()
        })
    }
}
