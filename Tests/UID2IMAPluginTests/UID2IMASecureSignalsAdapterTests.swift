//
//  UID2IMASecureSignalsAdapterTests.swift
//  
//
//  Created by Brad Leege on 3/20/23.
//

import XCTest
import GoogleInteractiveMediaAds
import UID2
import UID2IMAPlugin

final class UID2IMASecureSignalsAdapterTests: XCTestCase {
    /// 🟩 - IMA Adapter Request Signal Success
    func testRequestSignalsSuccess() async throws {
        // Seed the sample UID2Identity data in the UID2Manager
        await UID2Manager.shared.setAutomaticRefreshEnabled(false)
        await UID2Manager.shared.setIdentity(
            UID2Identity(
                advertisingToken: "uid2-test-token",
                refreshToken: "refresh-token",
                identityExpires: Date(timeIntervalSinceNow: 60 * 60).millisecondsSince1970,
                refreshFrom: Date(timeIntervalSinceNow: 60 * 40).millisecondsSince1970,
                refreshExpires: Date(timeIntervalSinceNow: 60 * 50).millisecondsSince1970,
                refreshResponseKey: ""
            )
        )

        let signal = try await UID2IMASecureSignalsAdapter().collectSignals()

        // Confirm that Adapter returns expected data
        XCTAssertEqual("uid2-test-token", signal)
    }
    
    /// 🟥 - GMA Adapter Request Signal Error No Identity
    func testRequestSignalsNoIdentity() async throws {
        // Ensure no identity is set
        await UID2Manager.shared.resetIdentity()

        let result = await Task<String?, Error> {
            try await UID2IMASecureSignalsAdapter().collectSignals()
        }.result
        XCTAssertThrowsError(try result.get()) { error in
            let adapterError = error as? AdvertisingTokenNotFoundError
            XCTAssertEqual(AdvertisingTokenNotFoundError(), adapterError)
        }
    }

    /// 🟥  - IMA Adapter Request Signal No Advertising Token Error
    func testRequestSignalsNoAdvertisingToken() async throws {
        // Set an identity with an invalid advertisingToken
        await UID2Manager.shared.setAutomaticRefreshEnabled(false)
        await UID2Manager.shared.setIdentity(
            UID2Identity(
                advertisingToken: "",
                refreshToken: "refresh-token",
                identityExpires: Date(timeIntervalSinceNow: 60 * 60).millisecondsSince1970,
                refreshFrom: Date(timeIntervalSinceNow: 60 * 40).millisecondsSince1970,
                refreshExpires: Date(timeIntervalSinceNow: 60 * 50).millisecondsSince1970,
                refreshResponseKey: ""
            )
        )

        let result = await Task<String?, Error> {
            try await UID2IMASecureSignalsAdapter().collectSignals()
        }.result
        XCTAssertThrowsError(try result.get()) { error in
            let adapterError = error as? AdvertisingTokenNotFoundError
            XCTAssertEqual(AdvertisingTokenNotFoundError(), adapterError)
        }
    }
    
    func testAdSDKVersion() async throws {
        let adSDKVersion = UID2IMASecureSignalsAdapter.adSDKVersion()
        let sdkVersion = await UID2Manager.shared.sdkVersion

        XCTAssertEqual(sdkVersion.major, adSDKVersion.majorVersion)
        XCTAssertEqual(sdkVersion.minor, adSDKVersion.minorVersion)
        XCTAssertEqual(sdkVersion.patch, adSDKVersion.patchVersion)
    }
}
