#
# Be sure to run `pod lib lint UK-Police-iOS-SDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "UK-Police-iOS-SDK"
  s.version          = "0.1.0"
  s.summary          = "UK Police iOS SDK."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = ''

  s.homepage         = "https://github.com/EnigmaticFlare/UK-Police-iOS-SDK"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Adam Roberts" => "adam@enigmaticflare.co.uk" }
  s.source           = { :git => "https://github.com/EnigmaticFlare/UK-Police-iOS-SDK.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/EnigmaticFlare'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'UK-Police-iOS-SDK/UKPoliceDataAPIManager.h'

  s.public_header_files = 'UK-Police-iOS-SDK/UKPoliceDataAPIManager.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'AFNetworking', '~> 2.3'
end
