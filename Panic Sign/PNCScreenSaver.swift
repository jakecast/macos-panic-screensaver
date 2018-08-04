import ScreenSaver
import SceneKit

class PNCScreenSaver: ScreenSaverView {
    lazy var preferencesController = PNCPreferencesController()

    var sceneView: PNCSceneView?

    override var configureSheet: NSWindow? {
        return self.preferencesController.window
    }

    override var hasConfigureSheet: Bool {
        return true
    }

    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }

    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        self.preferencesController.screenSaver = self
        self.redrawScene()
    }

    func redrawScene() {
        if let scene = self.sceneView {
            self.unloadScene(scene)
        }
        self.sceneView = PNCSceneView(
            frame: self.bounds,
            opts: [
                .preferredRenderingAPI: .rendering(.metal),
                .preferLowPowerDevice: .bool(true), ])
        self.sceneView?.prepare()
        self.sceneView?.addTo(superview: self)
    }

    func unloadScene(_ scene: PNCSceneView) {
        scene.removeFromSuperview()
    }
}
