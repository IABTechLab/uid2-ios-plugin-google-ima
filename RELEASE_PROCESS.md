## Release Process

Releases are performed via 2 Pull Requests (PR) that implements the release checklist and [GitHub Releases](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository).  This promotes consistency and visibility in the process.

### Version Numbers

Version Numbering follows [Semantic Versioning](https://semver.org) standards.  The format is `vMAJOR.MINOR.PATCH`.. ex `v0.1.0`

<img width="753" alt="semver-summary" src="https://user-images.githubusercontent.com/989928/230925438-ac6ac422-6358-4e96-9536-e3f8fc935317.png">

### Release Checklist

1. Create a Release PR
    * Update / Confirm that UID2 SDK version dependency is correct in `Package.swift`
      *https://github.com/IABTechLab/uid2-ios-plugin-google-ima/blob/ac286e2c9241c04c001ff7a42a4cbb1dfc2c80b9/Package.swift#L18
    * Update / Confirm `adapterVersion()` in `UID2IMASecureSignalsAdapter.swift` is set to expected version
      * https://github.com/IABTechLab/uid2-ios-plugin-google-ima/blob/ac286e2c9241c04c001ff7a42a4cbb1dfc2c80b9/Sources/UID2IMAPlugin/UID2IMASecureSignalsAdapter.swift#L24-L30
    * Add and / or Edit any ADRs that support this release
2. Merge Release PR into `main`
3. Use GitHub Releases to Publish the release
    * https://github.com/IABTechLab/uid2-ios-plugin-google-gma/releases/new
    * Create tag on `main` for the commit created by merge of the Release PR
    * Document any Release Notes
4. Create a Next Release PR
    * Set `adapterVersion()` in `UID2IMASecureSignalsAdapter.swift` to the expected next (likely minor) release version of the SDK.
5. Merge Next Release PR **BEFORE ANY CODE FOR NEXT RELEASE IS MERGED**
