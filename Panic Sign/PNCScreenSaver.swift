import ScreenSaver
import SceneKit

class PNCScreenSaver: ScreenSaverView {
    var sceneView: PNCSceneView? = nil

    lazy var preferences = PNCPreferencesController()

    override var configureSheet: NSWindow? {
        return self.preferences.window
    }

    override var hasConfigureSheet: Bool {
        return true
    }

    var notifier: NotificationCenter {
        return .default
    }

    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }

    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        self.redrawScene()
        self.notifier.addObserver(self, selector: #selector(preferencesDidChange), name: .preferencesDidChange, object: nil)
    }

    func redrawScene() {
        guard self.sceneView == nil else {
            return self.transitionScene(toScene: self.newScene())
        }
        self.sceneView = self.newScene()
        self.sceneView?.prepare()
        self.sceneView?.addTo(superview: self)
    }

    func unloadScene(_ scene: PNCSceneView) {
        scene.removeFromSuperview()
    }

    func transitionScene(toScene: PNCSceneView) {
        guard let fromScene = self.sceneView else {
            return
        }
        self.sceneView = toScene
        self.replaceSubview(fromScene, with: toScene)

    }

    func newScene() -> PNCSceneView {
        return PNCSceneView(
            frame: self.bounds,
            prepare: true,
            opts: [
                .preferredRenderingAPI: .rendering(.metal),
                .preferLowPowerDevice: .bool(true), ])
    }

    @objc
    func preferencesDidChange(_ notification: NSNotification?) {
        self.redrawScene()
    }
}
