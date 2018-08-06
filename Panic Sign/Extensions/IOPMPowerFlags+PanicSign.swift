import IOKit.ps
import IOKit.pwr_mgt

extension IOPMPowerFlags {
    static var adapterInfo: [String : Any]? {
        guard let info = IOPSCopyExternalPowerAdapterDetails()?.takeRetainedValue() as? [String : Any] else {
            return nil
        }
        return info
    }

    static var sourceInfo: [String : Any] {
        guard let info = IOPSCopyPowerSourcesInfo()?.takeRetainedValue() else {
            return [:]
        }
        guard let list = IOPSCopyPowerSourcesList(info)?.takeRetainedValue() as? [[String : Any]], !list.isEmpty else {
            return [:]
        }
        return list[0]
    }

    static var isUsingPowerAdapter: Bool {
        return self.adapterInfo != nil
    }
}
