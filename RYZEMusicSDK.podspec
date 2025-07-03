#
#  Be sure to run `pod spec lint RYZEMusicSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name             = 'RYZEMusicSDK'
  s.version          = '0.0.2'
  s.summary          = 'Shadhin RYZE Music SDK for iOS'
  s.description      = 'RYZEMusicSDK is an XCFramework-based SDK for integrating music features from Shadhin into iOS apps.'
  s.homepage         = 'https://github.com/shadhin-music/RYZEMusicSDK-iOS.git' # ✅ Must end with `.git`
  
  s.author           = { 'Md Maruf Prodhan' => 'mdmaruf@shadhinmusic.com' }
  s.license          = { :type => 'MIT', :file => 'LICENSE' }

  s.platform         = :ios, '13.0'
  s.swift_version    = '5.7'
  s.requires_arc     = true

  # ✅ Must point to the correct path and tag
  s.source           = { 
    :git => 'https://github.com/shadhin-music/RYZEMusicSDK-iOS.git', 
    :tag => s.version.to_s 
  }

  # ✅ Update this path if it's inside a folder (relative to the podspec)
  s.ios.vendored_frameworks = 'Releases/0.0.2/Shadhin_RYZE.xcframework'
end
