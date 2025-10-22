#
#  Be sure to run `pod spec lint RYZEMusicSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name                  = 'RYZEMusicSDK'
  s.version               = '0.0.32'
  s.summary               = 'Sample Spec'
  s.homepage              = 'https://github.com/shadhin-music/RYZEMusicSDK-iOS'

  s.author                = { 'Md Maruf Prodhan' => 'mdmaruf@shadhinmusic.com' }
  s.license               = { :type => 'MIT', :file => 'LICENSE' }

  # You can remove s.platform if you want; this is fine:
  s.ios.deployment_target = '13.0'
  s.swift_version         = '5.9'

  # IMPORTANT: include .git
  s.source = { :git => 'https://github.com/shadhin-music/RYZEMusicSDK-iOS.git', :tag => s.version.to_s }

  # If your xcframework contains Swift, CocoaPods typically works better with:
 
  s.ios.vendored_frameworks = 'Framework/Shadhin_RYZE.xcframework'
  s.requires_arc            = true
  s.static_framework = true
end

