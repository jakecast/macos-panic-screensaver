import Cocoa
import ScreenSaver

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet
    weak var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        guard let contentView = self.window.contentView, let screenSaver = PanicSignView(frame: contentView.bounds, isPreview: false) else {
            fatalError("missing content view or screensaver view")
        }
        contentView.addSubview(screenSaver)
        screenSaver.startAnimation()
    }

    func applicationWillTerminate(_ aNotification: Notification) {

    }
}
