# CustomActivityRingiOS

[![Version](https://img.shields.io/github/v/tag/jaydev6228/CustomActivityRingiOS?label=version&style=flat)](https://github.com/jaydev6228/CustomActivityRingiOS/tags)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg?style=flat)](https://github.com/jaydev6228/CustomActivityRingiOS)
[![Swift](https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat)](https://swift.org)

A small UIKit library for drawing a gradient activity ring with a configurable
track, line width and animated progress. User can set custom activity ring colors.

## Availability

> **This pod is not published on CocoaPods trunk.** It is not in the CocoaPods
> spec index, so `pod 'CustomActivityRingiOS'` will fail to resolve and the
> `cocoapods/v`, `cocoapods/l` and `cocoapods/p` shields.io badges cannot render.
> Install from git (see [Installation](#installation)) until a release is pushed
> to trunk. See [Publishing to CocoaPods](#publishing-to-cocoapods) for what is
> still required.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 9.0+ (as declared in the podspec)
- Swift 4.0 (as declared in the podspec)
- CocoaPods
- Depends on [`ActivityRingLib`](https://cocoapods.org/pods/ActivityRingLib) `~> 0.0.1`

## Installation

Because the pod is not on CocoaPods trunk, point CocoaPods at this repository
directly and pin a tag:

```ruby
pod 'CustomActivityRingiOS', :git => 'https://github.com/jaydev6228/CustomActivityRingiOS.git', :tag => '0.3.0'
```

Once a version is published to trunk, the usual line will work instead:

```ruby
pod 'CustomActivityRingiOS'
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

## Publishing to CocoaPods

`pod trunk push` has not yet succeeded for this pod. `pod trunk push` runs a
lint first and refuses to publish if it fails, so these need to be resolved:

- **`CustomActivityRingiOS/Classes/ProgressRing.swift`** — `fillLayer.lineCap` is
  assigned a `String` literal. Since Swift 4.2 that property is typed
  `CAShapeLayerLineCap`, so this no longer compiles; it needs to be `.round`.
- **`CustomActivityRingiOS.podspec`** — `s.swift_version = "4.0"`. Xcode 14 and
  later dropped support for the Swift 4 language modes, so the lint build
  cannot use this value.
- **`CustomActivityRingiOS.podspec`** — `s.ios.deployment_target = '9.0'` is
  below the minimum supported by current Xcode, which raises it and emits a
  warning. `pod lib lint` treats warnings as errors unless `--allow-warnings`
  is passed.

The `ActivityRingLib ~> 0.0.1` dependency is fine — it is published on trunk.

Verify locally before publishing:

```sh
pod lib lint CustomActivityRingiOS.podspec
pod trunk push CustomActivityRingiOS.podspec
```

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
