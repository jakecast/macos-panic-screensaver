import ScreenSaver
import SceneKit

class PNCScreenSaver: ScreenSaverView {
    var sceneView: PNCSceneView? = nil

    lazy var preferences = PNCPreferencesController(windowNibName: NSNib.Name("PNCPreferencesController"))

    override var configureSheet: NSWindow? {
        return self.preferences.window
    }

    override var hasConfigureSheet: Bool {
        return true
    }

    var notifier: NotificationCenter {
        return .default
    }

    override func animateOneFrame() {
        guard self.sceneView == nil else {
            return
        }
        self.setNeedsDisplay(self.frame)
    }

    override func draw(_ rect: NSRect) {
        guard self.sceneView == nil else {
            return
        }
        self.redrawScene()
        self.notifier.addObserver(self, selector: #selector(preferencesDidChange), name: .preferencesDidChange, object: nil)
    }

    func redrawScene() {
        guard self.sceneView == nil else {
            return self.transitionScene(toScene: self.newScene())
        }
        self.sceneView = self.newScene()
        self.sceneView?.addTo(superview: self)
    }

    func transitionScene(toScene: PNCSceneView) {
        guard let fromScene = self.sceneView else {
            return
        }
        self.sceneView?.unload()
        self.sceneView = toScene
        self.replaceSubview(fromScene, with: toScene)

    }

    func newScene() -> PNCSceneView {
        return PNCSceneView(
            frame: self.bounds,
            opts: [
                .preferredRenderingAPI: .rendering(.metal),
                .preferLowPowerDevice: .bool(.wantsLowerPowerGraphics), ])
    }

    @objc
    func preferencesDidChange(_ notification: NSNotification?) {
        self.redrawScene()
    }
}
