#
#  Be sure to run `pod spec lint RYZEMusicSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name                  = 'RYZEMusicSDK'
  s.version               = '0.0.15'
  s.summary               = 'Music SDK with popup player'
  s.homepage              = 'https://github.com/shadhin-music/RYZEMusicSDK-iOS'
  s.license               = { :type => 'MIT', :file => 'LICENSE' }
  s.author                = { 'Md Maruf Prodhan' => 'mdmaruf@shadhinmusic.com' }

  s.ios.deployment_target = '13.0'
  s.swift_version         = '5.9'
  s.requires_arc          = true

  s.source                = { :git => 'https://github.com/shadhin-music/RYZEMusicSDK-iOS.git',
                              :tag => s.version.to_s }

  # Vendored binary
  s.ios.vendored_frameworks = 'Framework/Shadhin_RYZE.xcframework'

  # Helpful for Obj-C categories (e.g., popup controller APIs)
  s.pod_target_xcconfig   = { 'OTHER_LDFLAGS' => '-ObjC' }

  # System frameworks actually used by the SDK
  s.frameworks = 'UIKit', 'AVFoundation', 'MediaPlayer'
  s.static_framework        = true

end
