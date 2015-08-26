Pod::Spec.new do |spec|
  spec.name         = 'UKPoliceDataiOSSDK'
  spec.version      = '1.0.0'
  spec.license      = { :type => 'BSD' }
  spec.homepage     = 'https://github.com/EnigmaticFlare/UKPoliceDataiOSSDK'
  spec.authors      = { 'Adam Roberts' => 'adam@enigmaticflare.co.uk', 'Josh Santos' => 'nerdsville@nerdsville.net' }
  spec.summary      = 'iOS SDK for data.police.uk'
  spec.source       = { :git => 'git@github.com:EnigmaticFlare/UKPoliceDataiOSSDK.git', :tag => 'v.1.0.0' }
  spec.source_files = 'UKPoliceDataSDK/**/*.{h,m}'
  spec.requires_arc     = true
end
