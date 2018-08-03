import ScreenSaver
import SceneKit

class PNCScreenSaver: ScreenSaverView {
    lazy var preferencesController = PNCPreferencesController()

    lazy var sceneView: PNCSceneView = PNCSceneView(
        frame: self.bounds,
        opts: [
            .preferredRenderingAPI: .rendering(.metal),
            .preferLowPowerDevice: .bool(true), ])

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
        self.sceneView.prepare()
        self.addSubview(self.sceneView)
    }
}
