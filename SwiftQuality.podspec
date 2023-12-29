
Pod::Spec.new do |s|

  s.name         = "SwiftQuality"
  s.version      = "2.0.2"
  s.summary      = "Common configuration files for SwiftLint and SwiftFormat."

  s.homepage     = "https://github.com/yonat/SwiftQuality"

  s.license      = { :type => "MIT", :file => "LICENSE.txt" }

  s.author             = { "Yonat Sharon" => "yonat@ootips.org" }
  s.social_media_url   = "https://twitter.com/yonatsharon"

  s.swift_versions = ['4.2', '5.0', '5.2', '5.3']
  s.platform     = :ios, "11.0"
  s.requires_arc = true

  s.source        = { :git => "https://github.com/yonat/SwiftQuality.git", :tag => s.version }
  s.preserve_paths  = '.swiftformat', '.swiftlint.yml'

  s.dependency 'SwiftLint', '0.54.0'
  s.dependency 'SwiftFormat/CLI', '0.52.11'

end
