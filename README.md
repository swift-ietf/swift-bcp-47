# swift-bcp-47

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

Parsing, validation, and canonicalization of BCP 47 language tags.

## Standard Reference

- **BCP**: 47
- **Title**: Tags for Identifying Languages

## Installation

Add the package to your `Package.swift` dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/swift-ietf/swift-bcp-47.git", from: "0.1.4")
]
```

Add the product to a target that needs it:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "BCP 47", package: "swift-bcp-47")
    ]
)
```

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
