# CustomActivityRingiOS

[![Version](https://img.shields.io/github/v/tag/jaydev6228/CustomActivityRingiOS?label=version&style=flat)](https://github.com/jaydev6228/CustomActivityRingiOS/tags)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-iOS-lightgrey.svg?style=flat)](https://github.com/jaydev6228/CustomActivityRingiOS)
[![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg?style=flat)](https://swift.org)

A small UIKit library for drawing a gradient activity ring with a configurable
track, line width and animated progress. User can set custom activity ring colors.

## Availability

> **This pod is not yet published on CocoaPods trunk.** It is not in the
> CocoaPods spec index, so `pod 'CustomActivityRingiOS'` will fail to resolve.
> Install from git (see [Installation](#installation)) until a release is pushed
> to trunk. The lint failures that were blocking publication are fixed as of
> `0.3.3` — see [Publishing to CocoaPods](#publishing-to-cocoapods).

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 15.0+ (as declared in the podspec)
- Swift 5.0 (as declared in the podspec)
- CocoaPods
- No third-party dependencies (UIKit only)

## Installation

Because the pod is not on CocoaPods trunk, point CocoaPods at this repository
directly and pin a tag:

```ruby
pod 'CustomActivityRingiOS', :git => 'https://github.com/jaydev6228/CustomActivityRingiOS.git', :tag => '0.3.3'
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

`pod trunk push` has never succeeded for this pod. `pod trunk push` runs
`pod lib lint` first and refuses to publish if it fails. These are the failures
that were blocking it, all fixed as of `0.3.3`:

- `fillLayer.lineCap` was assigned a `String` literal. Since Swift 4.2 that
  property is typed `CAShapeLayerLineCap`, so it no longer compiled. Now `.round`.
- `s.swift_version` was `"4.0"`. Xcode 14 and later dropped the Swift 4 language
  modes, so the lint build could not use it. Now `"5.0"`.
- The podspec depended on `ActivityRingLib`, whose source repo
  `github.com/jaydev6228/ActivityRingLib` is **private**, so lint could not
  clone it — and neither could any user of the published pod. Nothing in
  `Classes/` imported it, so it was removed. Do not re-add it unless that
  repository is made public.
- `s.ios.deployment_target` was `'9.0'`, then briefly `'12.0'`. Current Xcode
  accepts a deployment target in the range 15.0–27.1 and errors below it, so
  the value is now `'15.0'`. `Example/Podfile` uses the same floor.

Publishing requires macOS with Xcode — the lint compiles for the iOS simulator.
From a Mac:

```sh
# one-time, if not already registered
pod trunk register jaydevbaloliya@gmail.com 'jaydev6228'

git tag 0.3.3 && git push origin 0.3.3   # s.source pins :tag => s.version
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
