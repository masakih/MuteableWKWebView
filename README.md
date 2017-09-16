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
