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
public class UID2IMASecureSignalsAdapter: NSObject {
    
    required public override init() { }
    
}

extension UID2IMASecureSignalsAdapter: IMASecureSignalsAdapter {
    
    public static func adapterVersion() -> IMAVersion {
        let version = IMAVersion()
        version.majorVersion = 0
        version.minorVersion = 0
        version.patchVersion = 1
        return version
    }
    
    public static func adSDKVersion() -> IMAVersion {
        let version = IMAVersion()
        version.majorVersion = UID2SDKProperties.getUID2SDKVersion().major
        version.minorVersion = UID2SDKProperties.getUID2SDKVersion().minor
        version.patchVersion = UID2SDKProperties.getUID2SDKVersion().patch
        return version
    }
    
    public func collectSignals(completion: @escaping IMASignalCompletionHandler) {
        
        Task {
            guard let advertisingToken = await UID2Manager.shared.getAdvertisingToken() else {
                completion(nil, UID2GoogleAdapterErrors.advertisingTokenNotFoundForIMA)
                return
            }
            completion(advertisingToken, nil)
        }
        
    }
}
