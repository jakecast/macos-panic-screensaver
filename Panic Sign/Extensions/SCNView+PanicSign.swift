import SceneKit

extension SCNView {
    convenience init(frame: NSRect, opts: [SCNView.Option : SCNViewSetting]? = nil) {
        self.init(
            frame: frame,
            options: opts?.transform({ (key: SCNView.Option, value: SCNViewSetting) in (key.rawValue, value.rawValue) }))
    }
}
