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

target `MyApp` do
  script_phase :name => 'SwiftFormat',
    :execution_position => :before_compile,
    :script => 'if [[ "Debug" == "${CONFIGURATION}" && ! $ENABLE_PREVIEWS == "YES" ]]; then "${PODS_ROOT}/SwiftFormat/CommandLineTool/swiftformat" --swiftversion ${SWIFT_VERSION} --config "${PODS_ROOT}/SwiftQuality/.swiftformat" "${SRCROOT}" ; fi'

  script_phase :name => 'SwiftLintAutocorrect',
    :execution_position => :before_compile,
    :script => 'if [[ "Debug" == "${CONFIGURATION}" && ! $ENABLE_PREVIEWS == "YES" ]]; then "${PODS_ROOT}/SwiftLint/swiftlint" --fix --config "${PODS_ROOT}/SwiftQuality/.swiftlint.yml" "${SRCROOT}" ; fi'

  script_phase :name => 'SwiftLint',
    :execution_position => :after_compile,
    :script => 'if [ "Debug" == "${CONFIGURATION}" && ! $ENABLE_PREVIEWS == "YES" ]; then "${PODS_ROOT}/SwiftLint/swiftlint" --config "${PODS_ROOT}/SwiftQuality/.swiftlint.yml" "${SRCROOT}" ; fi'
  end
end

# Fix Xcode 14 warnings "Run script build phase '[CP] _____' will be run during every build because it does not specify any outputs."
# Based on https://github.com/CocoaPods/CocoaPods/issues/11444#issuecomment-1300023416
post_integrate do |installer|
  main_project = installer.aggregate_targets[0].user_project
  main_project.targets.each do |target|
    target.build_phases.each do |phase|
      next unless phase.is_a?(Xcodeproj::Project::Object::PBXShellScriptBuildPhase)
      next unless phase.name.start_with?("[CP")
      next unless (phase.input_paths || []).empty? && (phase.output_paths || []).empty?
      phase.always_out_of_date = "1"
    end
  end
  main_project.save
end
```

## Meta

[@yonatsharon](https://twitter.com/yonatsharon)

[https://github.com/yonat/SwiftQuality](https://github.com/yonat/SwiftQuality)

[swift-image]:https://img.shields.io/badge/swift-4.2-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE.txt
