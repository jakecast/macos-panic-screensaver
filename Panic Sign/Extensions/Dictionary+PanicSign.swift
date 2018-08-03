import Foundation

extension Dictionary {
    func transform<K, V>(_ transform: ((key: Key, value: Value)) throws -> (K, V)) rethrows -> [K : V] {
        return Dictionary<K, V>(try self.map(transform), uniquingKeysWith: { (first, _) in first })
    }
}
