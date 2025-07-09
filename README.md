# RYZEMusicSDK-iOS

[![Version](https://img.shields.io/cocoapods/v/RYZEMusicSDK)](https://cocoapods.org/pods/RYZEMusicSDK)
[![License](https://img.shields.io/github/license/shadhin-music/RYZEMusicSDK-iOS)](https://github.com/shadhin-music/RYZEMusicSDK-iOS/blob/main/LICENSE)
[![Platforms](https://img.shields.io/badge/Platforms-iOS%2011%2B-blue.svg)](https://github.com/shadhin-music/RYZEMusicSDK-iOS/blob/main/LICENSE)
[![Languages](https://img.shields.io/badge/language-%20swift-FF69B4.svg?style=plastic)](#)
[![Code-Size](https://img.shields.io/github/languages/code-size/shadhin-music/RYZEMusicSDK-iOS)](#)

## Installation

RYZEMusicSDK is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RYZEMusicSDK'
```
## SDK Initilization 
In Appdelegate SDK initilization process with token and call back delegate 
```ruby
import Shadhin_RYZE

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        //received music control from notification bar
        application.beginReceivingRemoteControlEvents()
        //initilize sdk with token
        ShadhinRyze.shared.initialize(with: "", delegate: self)
        return true
    }
    
```
Media control setup from AppDelegate
```ruby
 override func remoteControlReceived(with event: UIEvent?) {
        if let event = event {
            //register event
            ShadhinRyze.shared.eventRegister(with: event)
            
        }
    }
```
Get Music home controller you need to pass root navigation controller for navigate music conntroller and mini player always visible from any controller. 

We provide that direct push to navigation controller and membership parameter
Here need to pass the value for membership status. 
```ruby
ShadhinRyze.shared.gotoHome(with: self.tabBarController, navigationController: self.navigationController!,membership ="silver")
```
There is other feature we implemented that can direct navigate to our controller 

## POPULAR ARTIST 
```ruby
 ShadhinRyze.shared.openPatch(patchID: FeatureType.POPULAR_ARTIST.rawValue, navigationController: self.navigationController!,tabController: self.tabBarController)
```
## LATEST RELEASE 
```ruby
 ShadhinRyze.shared.openPatch(patchID:FeatureType.LATEST_RELEASE.rawValue, navigationController: self.navigationController!,tabController: self.tabBarController)
```
## POPULAR VIDEO
```ruby
 ShadhinRyze.shared.openPatch(patchID: FeatureType.POPULAR_VIDEO.rawValue, navigationController: self.navigationController!,tabController: self.tabBarController)
```
## PODCAST 
```ruby
 ShadhinRyze.shared.openPatch(patchID: FeatureType.PODCAST.rawValue, navigationController: self.navigationController!,tabController: self.tabBarController)
```
## AMAR TUNE 
```ruby
ShadhinRyze.shared.openPatch(patchID: FeatureType.AMAR_TUNE.rawValue, navigationController: self.navigationController!,tabController: self.tabBarController)
 ```
## AMAR TUNE TOP 100
```ruby
 ShadhinRyze.shared.openPatch(patchID: FeatureType.AMAR_TUNE_TOP_100.rawValue, navigationController: self.navigationController!,tabController: self.tabBarController)
```
## Goto Radio
```ruby
ShadhinRyze.shared.gotoRadio(nav: self.navigationController!,tabController: self.tabBarController)
```
## Stop Music
```ruby
ShadhinRyze.shared.stopMusic()
```
## Play Music
```ruby
ShadhinRyze.shared.playMusic()
```
## Pause Music
```ruby
ShadhinRyze.shared.pauseMusic()
```
## Clear All Cache
```ruby
ShadhinRyze.shared.clearAllCache()
```
## Open RC Code
```ruby
ShadhinRyze.shared.openPatch(patchID: "MjM1OV9QREJD", navigationController: self.navigationController!, tabController: self.tabBarController)
```

## PERMISSION 
Add App Transport Security to your info.plist
```ruby
     <key>NSAppTransportSecurity</key>
    <dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
    </dict>
```
From your Project target Signing & Capabilities add Background Mood and select 'Audio,Airplay, and picture in picture','Background Processing'


## Author

MD Maruf Prodhan , mdmaruf.shadhin@gmail.com

## Company

[Gakk Media](https://gakkmedia.com)

## License

RYZEMusicSDK is available under the MIT license. See the LICENSE file for more info
