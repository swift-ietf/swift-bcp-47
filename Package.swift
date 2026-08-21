// swift-tools-version: 6.4
import PackageDescription

extension String {
    static let bcp47: Self = "BCP 47"
    static let bcp47Tests: Self = bcp47 + " Tests"

    static let rfc5646: Self = "RFC 5646"

    var tests: Self { self + " Tests" }
}

extension PackageDescription.Target.Dependency {
    static let rfc5646: Self = .product(name: "RFC 5646", package: "swift-rfc-5646")
    static let standards: Self = .product(
        name: "Standard Library Extensions",
        package: "swift-standard-library-extensions"
    )

    static let bcp47: Self = .target(name: .bcp47)
}

let package = Package(
    name: "swift-bcp-47",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
    ],
    products: [
        .library(name: "BCP 47", targets: ["BCP 47"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-primitives/swift-standard-library-extensions.git",
            branch: "main"
        ),
        .package(url: "https://github.com/swift-ietf/swift-rfc-5646.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "BCP 47",
            dependencies: [
                .standards,
                .rfc5646,
            ]
        ),
        .testTarget(
            name: "BCP 47 Tests",
            dependencies: [
                "BCP 47"
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
