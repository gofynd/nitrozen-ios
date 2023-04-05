// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "Nitrozen-SwiftUI",
	platforms: [
		.iOS(.v13)
	],
	products: [
		// Products define the executables and libraries a package produces, and make them visible to other packages.
		.library(
			name: "Nitrozen-SwiftUI",
			targets: [
				"Nitrozen-SwiftUI"
			]
		),
	],
	dependencies: [
		.package(url: "https://github.com/exyte/ActivityIndicatorView.git", from: .init(1, 1, 1)),
		.package(url: "https://github.com/hitendradeveloper/FloatingTextField-SwiftUI", branch: "v1.3.3")
	],
	targets: [
		// Targets are the basic building blocks of a package. A target can define a module or a test suite.
		// Targets can depend on other targets in this package, and on products in packages this package depends on.
		.target(
			name: "Nitrozen-SwiftUI",
			dependencies: [
				.product(name: "ActivityIndicatorView", package: "ActivityIndicatorView"),
				.product(name: "FloatingTextField-SwiftUI", package: "FloatingTextField-SwiftUI")
			],
			resources: [
					.copy("Resources/Fonts/jio_type_black.ttf"),
					.copy("Resources/Fonts/jio_type_bold.ttf"),
					.copy("Resources/Fonts/jio_type_light.ttf"),
					.copy("Resources/Fonts/jio_type_medium.ttf"),
					.copy("Resources/Fonts/jio_type_regular.ttf")
				])
	]
)
