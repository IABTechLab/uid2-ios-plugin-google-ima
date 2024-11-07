//
//  UID2IMASecureSignalsAdapter.swift
//  
//
//  Created by Brad Leege on 3/20/23.
//

import Foundation
import GoogleInteractiveMediaAds
import UID2

@available(iOS 13.0, *)
@objc(UID2IMASecureSignalsAdapter)
public class UID2IMASecureSignalsAdapter: NSObject {

    required public override init() {
        guard isOperatingSystemSupported else {
            return
        }
        // Ensure UID2Manager has started
        _ = UID2Manager.shared
    }
    
}

@available(iOS 13, *)
extension UID2IMASecureSignalsAdapter: IMASecureSignalsAdapter {
    
    public static func adapterVersion() -> IMAVersion {
        let version = IMAVersion()
        version.majorVersion = 1
        version.minorVersion = 0
        version.patchVersion = 2
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
        guard isOperatingSystemSupported else {
            completion(nil, OperatingSystemUnsupportedError())
            return
        }
        Task {
            guard let advertisingToken = await UID2Manager.shared.getAdvertisingToken() else {
                completion(nil, AdvertisingTokenNotFoundError())
                return
            }
            completion(advertisingToken, nil)
        }
        
    }
}
