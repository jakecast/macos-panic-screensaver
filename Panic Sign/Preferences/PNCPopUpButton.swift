import AppKit

class PNCPopUpButton: NSPopUpButton {
    var menuItems: [PNCMenuItem] {
        guard let items = self.itemArray as? [PNCMenuItem] else {
            return []
        }
        return items
    }

    var selectedItemColorValue: Int {
        guard let selectedItem = self.selectedItem as? PNCMenuItem else {
            return 0
        }
        return selectedItem.panicColorValue
    }

    func selectItem(withColorValue: Int) {
        guard let item = self.item(withColorValue: withColorValue) else {
            return
        }
        self.select(item)
    }

    func item(withColorValue: Int) -> PNCMenuItem? {
        return self.menuItems.first(where: { $0.panicColorValue == withColorValue })
    }
}
