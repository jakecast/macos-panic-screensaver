import Cocoa

extension CGSize {
    static let panicLetterInsize = CGSize(width: 0.4630380647, height: 0.2478704023)
    static let panicLetterLegsize = CGSize(width: 0.6482390608, height: 0.2394504899)

    init(size: CGSize, ratio: CGSize) {
        self.init(width: size.width * ratio.width, height: size.height * ratio.height)
    }
}
