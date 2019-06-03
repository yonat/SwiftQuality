
Pod::Spec.new do |s|

  s.name         = "SwiftQuality"
  s.version      = "1.0.1"
  s.summary      = "Common configuration files for SwiftLint and SwiftFormat."

  s.homepage     = "https://github.com/yonat/SwiftQuality"

  s.license      = { :type => "MIT", :file => "LICENSE.txt" }

  s.author             = { "Yonat Sharon" => "yonat@ootips.org" }
  s.social_media_url   = "http://twitter.com/yonatsharon"

  s.swift_version = '4.2'
  s.platform     = :ios, "9.0"
  s.requires_arc = true

  s.source        = { :git => "https://github.com/yonat/SwiftQuality.git", :tag => s.version }
  s.resources  = '.swiftformat', '.swiftlint.yml'

  s.dependency 'SwiftLint', '0.33.0'
  s.dependency 'SwiftFormat/CLI', '0.40.9'

end
