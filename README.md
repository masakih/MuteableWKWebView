
[![Build Status](https://travis-ci.org/masakih/WKWebKitMuteExt.svg?branch=master)](https://travis-ci.org/masakih/WKWebKitMuteExt)
[![License](https://img.shields.io/github/license/masakih/WKWebKitMuteExt.svg)](https://github.com/masakih/WKWebKitMuteExt/blob/master/LICENSE)
[![GitHub release](https://img.shields.io/github/release/masakih/WKWebKitMuteExt.svg)](https://github.com/masakih/WKWebKitMuteExt/releases/latest)

# WKWebKitMuteExt
Mute per WKWebView like Safari.

----
# How to use

Interface:
```objc
@interface WKWebView (HMMuteExtension)

@property (getter=isMuted) BOOL muted;

@end
```

WKWebKitMuteExt append mute property into WKWebView.

Usage:
```objc
WKWebView *webView;

// mute
webView.muted = YES;

// unmute
webView.muted = NO;
```
----

powered by https://github.com/hetima/HTSymbolHook.
