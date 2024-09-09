//
//  EUIDIMASecureSignalsAdapter.swift
//  

import Foundation
import GoogleInteractiveMediaAds
import UID2

@available(iOS 13.0, *)
@objc(EUIDIMASecureSignalsAdapter)
public class EUIDIMASecureSignalsAdapter: NSObject {
    
    required public override init() {
        // Ensure UID2Manager has started
        _ = EUIDManager.shared
    }
    
}

@available(iOS 13, *)
extension EUIDIMASecureSignalsAdapter: IMASecureSignalsAdapter {
    
    public static func adapterVersion() -> IMAVersion {
        let version = IMAVersion()
        version.majorVersion = 1
        version.minorVersion = 0
        version.patchVersion = 0
        return version
    }
    
    public static func adSDKVersion() -> IMAVersion {
        let sdkVersion = UID2SDKProperties.getUID2SDKVersion()
        let version = IMAVersion()
        version.majorVersion = sdkVersion.major
        version.minorVersion = sdkVersion.minor
        version.patchVersion = sdkVersion.patch
        return version
    }
    
    public func collectSignals(completion: @escaping IMASignalCompletionHandler) {
        Task {
            guard let advertisingToken = await EUIDManager.shared.getAdvertisingToken() else {
                completion(nil, AdvertisingTokenNotFoundError())
                return
            }
            completion(advertisingToken, nil)
        }
    }
}
