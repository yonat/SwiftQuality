# SwiftQuality

[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/SwiftQuality.svg)](https://img.shields.io/cocoapods/v/SwiftQuality.svg)  
[![Platform](https://img.shields.io/cocoapods/p/SwiftQuality.svg?style=flat)](http://cocoapods.org/pods/SwiftQuality)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

Common configuration files for SwiftLint and SwiftFormat.

## Installation

### CocoaPods:

```ruby
pod 'SwiftQuality', :git => 'https://github.com/yonat/SwiftQuality'

script_phase :name => 'SwiftFormat',
  :execution_position => :before_compile,
  :script => 'if [ "Debug" == "${CONFIGURATION}" ]; then ${PODS_ROOT}/SwiftFormat/CommandLineTool/swiftformat --swiftversion ${SWIFT_VERSION} --config ${PODS_ROOT}/SwiftQuality/.swiftformat ${SRCROOT} ; fi'

script_phase :name => 'SwiftLintAutocorrect',
  :execution_position => :before_compile,
  :script => 'if [ "Debug" == "${CONFIGURATION}" ]; then ${PODS_ROOT}/SwiftLint/swiftlint autocorrect --config ${PODS_ROOT}/SwiftQuality/.swiftlint.yml --path ${SRCROOT} ; fi'

script_phase :name => 'SwiftLint',
  :execution_position => :after_compile,
  :script => 'if [ "Debug" == "${CONFIGURATION}" ]; then ${PODS_ROOT}/SwiftLint/swiftlint --config ${PODS_ROOT}/SwiftQuality/.swiftlint.yml --path ${SRCROOT} ; fi'
```

## Meta

[@yonatsharon](https://twitter.com/yonatsharon)

[https://github.com/yonat/SwiftQuality](https://github.com/yonat/SwiftQuality)

[swift-image]:https://img.shields.io/badge/swift-4.2-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE.txt
