#
#  Be sure to run `pod spec lint RYZEMusicSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
    s.name              = 'RYZEMusicSDK' # Name for your pod
    s.version           = '0.0.6'
    s.summary           = 'Sample Spec'
    s.homepage          = 'https://github.com/shadhin-music/RYZEMusicSDK-iOS'

    s.author            = { 'Md Maruf Prodhan' => 'mdmaruf@shadhinmusic.com' }
    s.license      = { :type => "MIT", :file => "LICENSE" }

    s.platform          = :ios
    # change the source location
    s.source            = { :git => "https://github.com/shadhin-music/RYZEMusicSDK-iOS", :tag => "#{s.version}" }
    s.ios.deployment_target = '11.0'
    s.swift_version = "5.7"
   s.ios.vendored_frameworks = 'Framework/Shadhin_RYZE.xcframework'
    s.requires_arc = true
end
