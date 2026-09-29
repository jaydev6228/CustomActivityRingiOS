# CustomActivityRingiOS

[![Version](https://img.shields.io/cocoapods/v/CustomActivityRingiOS.svg?style=flat)](https://cocoapods.org/pods/CustomActivityRingiOS)
[![License](https://img.shields.io/cocoapods/l/CustomActivityRingiOS.svg?style=flat)](https://cocoapods.org/pods/CustomActivityRingiOS)
[![Platform](https://img.shields.io/cocoapods/p/CustomActivityRingiOS.svg?style=flat)](https://cocoapods.org/pods/CustomActivityRingiOS)
[![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat)](https://swift.org)

A small UIKit library for drawing a gradient activity ring with a configurable
track, line width and animated progress. User can set custom activity ring colors.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 15.0+ (as declared in the podspec)
- Swift 5.0 (as declared in the podspec)
- CocoaPods
- No third-party dependencies (UIKit only)

## Installation

CustomActivityRingiOS is available through [CocoaPods](https://cocoapods.org).
Add this to your Podfile:

```ruby
pod 'CustomActivityRingiOS'
```

To pin a specific version, or to track the repository directly:

```ruby
pod 'CustomActivityRingiOS', '~> 0.3.3'
```

## Usage

`ProgressRing` is a `UIView` subclass. Add it in a storyboard/xib (it sets
itself up in `awakeFromNib`), then configure and animate it:

```swift
import CustomActivityRingiOS

ring.lineWidth = 12.0
ring.trackColor = UIColor.gray.withAlphaComponent(0.2)
ring.trackGradientColor = [UIColor.systemPink.cgColor, UIColor.systemOrange.cgColor]
ring.setProgress(to: 0.75, withAnimation: true)
```

## Releasing a new version

`0.3.3` was the first version accepted by CocoaPods trunk. Releasing requires
macOS with Xcode, because `pod lib lint` builds the pod for the iOS simulator.

```sh
# 1. bump s.version in CustomActivityRingiOS.podspec, then commit
# 2. tag the commit the podspec points at — s.source pins :tag => s.version
git tag 0.3.4 && git push origin 0.3.4
# 3. validate and publish
pod lib lint CustomActivityRingiOS.podspec
pod trunk push CustomActivityRingiOS.podspec
```

Constraints worth keeping in mind when changing the podspec:

- `s.ios.deployment_target` must sit inside the range current Xcode supports
  (15.0–27.1 at the time of the `0.3.3` release). Anything lower is a hard
  build error, not a warning. `Example/Podfile` tracks the same floor.
- `s.swift_version` must be `"5.0"` or later; Xcode 14 dropped the Swift 4
  language modes.
- Do not add a dependency on `ActivityRingLib`. Its source repository is
  private, so neither lint nor any consumer of this pod can clone it, and
  nothing in `Classes/` imports it.
- `CAShapeLayer.lineCap` takes a `CAShapeLayerLineCap`, not a `String`.

## Continuous integration

The previous CI badge pointed at travis-ci.org, which was shut down in 2021;
shields.io removed the matching badge endpoint, which is why it rendered as
`404 badge not found`. The badge has been removed. `.travis.yml` is also
pinned to `osx_image: xcode7.3` and no longer runnable — it needs replacing
with a GitHub Actions workflow before a CI badge is worth adding back.

## Author

jaydev6228, jaydevbaloliya@gmail.com

## License

CustomActivityRingiOS is available under the MIT license. See the LICENSE file for more info.
