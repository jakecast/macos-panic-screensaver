import SceneKit

extension SCNView {
    convenience init(frame: NSRect, opts: [SCNView.Option : SCNViewSetting]? = nil) {
        self.init(
            frame: frame,
            options: opts?.transform({ ($0.rawValue, $1.rawValue) }))
    }
}
