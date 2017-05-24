# WKWebKitMuteExt
Mute per WKWebView like Safari.

----
# How to use

Interface:
```objc
typedef NS_OPTIONS(NSInteger, _WKMediaMutedState) {
    _WKMediaNoneMuted = 0,
    _WKMediaAudioMuted = 1 << 0,
    _WKMediaCaptureDevicesMuted = 1 << 1,
};


@interface WKWebView (HMMuteExtension)

@property _WKMediaMutedState mute;

@end
```

WKWebKitMuteExt append mute property into WKWebView.

Usage:
```objc
WKWebView *webView;

// mute
webView.mute = _WKMediaAudioMuted;

// unmute
webView.mute = _WKMediaNoneMuted;
```

----

powered by https://github.com/hetima/HTSymbolHook.
