//
//  IMASecureSignalsAdapter+TestExtensions.swift
//

import GoogleInteractiveMediaAds

/// Adds an async wrapper interface to simplify testing
extension IMASecureSignalsAdapter {
    func collectSignals() async throws -> String? {
        try await withCheckedThrowingContinuation { continuation in
            collectSignals(completion: { signal, error in
                guard error == nil else {
                    continuation.resume(throwing: error!)
                    return
                }
                continuation.resume(returning: signal)
            })
        }
    }
}
