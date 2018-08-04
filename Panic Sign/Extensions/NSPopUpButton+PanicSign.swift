import AppKit

extension NSPopUpButton {
    func item(withIdentifier identifier: String) -> NSMenuItem? {
        return self.itemArray.first(where: { $0.identifier?.rawValue == identifier })
    }

    func selectItem(withIdentifier identifier: String) {
        guard let item = self.item(withIdentifier: identifier) else {
            return
        }
        self.select(item)
    }
}
