# HorizontalTextView

[![CI Status](https://img.shields.io/travis/ahmedk92/HorizontalTextView.svg?style=flat)](https://travis-ci.org/ahmedk92/HorizontalTextView)
[![Version](https://img.shields.io/cocoapods/v/HorizontalTextView.svg?style=flat)](https://cocoapods.org/pods/HorizontalTextView)
[![License](https://img.shields.io/cocoapods/l/HorizontalTextView.svg?style=flat)](https://cocoapods.org/pods/HorizontalTextView)
[![Platform](https://img.shields.io/cocoapods/p/HorizontalTextView.svg?style=flat)](https://cocoapods.org/pods/HorizontalTextView)

## TODO

- [ ] RTL
- [ ] IB Integration
- [ ] Selection

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 10+
- Swift 4.2

## Installation

HorizontalTextView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'HorizontalTextView'
```

## Author

ahmedk92, ahmedkhalaf.92@gmail.com

## License

HorizontalTextView is available under the MIT license. See the LICENSE file for more info.

## Idead

This is a straightforward implementation of the idea described here in the [official docs](https://developer.apple.com/library/archive/documentation/StringsTextFonts/Conceptual/TextAndWebiPhoneOS/CustomTextProcessing/CustomTextProcessing.html#//apple_ref/doc/uid/TP40009542-CH4-SW67). 

An `NSLayoutManager` gradually lays out text (`NSTextStorage`) in a series of `NSTextContainer` objects (each representing a page of text). A separate `UITextView` is created for each `NSTextContainer`, and they take care of actual rendering. Then a `UIScrollView` wraps the text views for scrolling/paging.

## Contribution

Contributions are welcome in the form of issues, but pull requests are preferred. Please consider the following when submitting code:

1. Add documentation for public properties and functions.
2. Make a separate pull request for each feature/bugfix.
3. If new files are added, please make sure they're included in the podspec. For convenience, just add it in the `Classes` subfloder.